ARG TF_VERSION=latest
ARG CONF_TEST_VERSION=latest

FROM hashicorp/terraform:$TF_VERSION as tf_build
FROM instrumenta/conftest:${CONF_TEST_VERSION} as conftest_build

FROM ubuntu:bionic

COPY --from=tf_build /bin/terraform /bin/terraform
COPY --from=conftest_build /usr/local/bin/conftest /bin/conftest

RUN apt update && apt-get install -y make ca-certificates jq curl gnupg2
RUN update-ca-certificates

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main"  \
    | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update -y && apt-get install google-cloud-sdk -y

WORKDIR /app

ENTRYPOINT ["bash"]
