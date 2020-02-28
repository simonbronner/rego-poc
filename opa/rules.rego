package anz.rules

import data.anz.terraform.queries as tf


is_labelled_correctly(address) {
  resource = tf.resource_changes_labels[address]
  resource.something
}

default datasets_labelled_correctly = false
datasets_labelled_correctly {
  resource_addresses := [x | x := data[_].resource_changes[_].address; startswith(x, "google_bigquery_dataset")]
  correctly_labelled := [rn | rn := resource_addresses[_]; is_labelled_correctly(rn)]
  count(resource_addresses) == count(correctly_labelled)
}

default allow = false
allow {
  datasets_labelled_correctly
}