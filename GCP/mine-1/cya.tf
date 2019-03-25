provider "google" {
  credentials = "${file("/home/ychertkov/ts/ardent-oven-235508-01e464e25601.json")}"
  project     = "ardent-oven-235508"
  region      = "us-west1-b"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "g1-small"
  zone         = "us-west1-b"

  tags = ["cya", "dev"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # // Local SSD disk
  # scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
