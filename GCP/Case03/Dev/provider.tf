/*------------ Provider GCP -------------------*/
provider "google" {
  credentials	= "${file("${var.path_to_context}")}"
  project    	= "${var.project_name}"
  region     	= "${var.region}"
}

terraform {
  backend "gcs" {
    bucket  = "ychertkov-test"
    prefix  = "terraform/dev"
    credentials	= "/home/ychertkov/ts/ardent-oven-235508-01e464e25601.json"
  }
}