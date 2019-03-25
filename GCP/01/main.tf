provider "google" {
  credentials = "${file("/home/ychertkov/ts/ardent-oven-235508-01e464e25601.json")}"
  project     = "ardent-oven-235508"
  region      = "us-west1-b"
}

resource "google_compute_disk" "default" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "us-west1-b"
  image = "debian-8-jessie-v20170523"
  labels = {
    environment = "dev"
  }
}