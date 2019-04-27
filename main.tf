provider "google" {
  project = "speedy-filament-237716"
  zone = "europe-west3-c"
  credentials = "/home/przemyslaw/PycharmProjects/hello world/gce/account.json"
}

resource "google_compute_address" "ip-1" {
  name = "sda1-ip"
}

resource "google_compute_network" "vpc-network-1" {
  name = "sda-vpc-network-1"
  auto_create_subnetworks = "true"
  routing_mode = "GLOBAL"
}

resource "google_compute_network" "vpc-network-2" {
  name = "sda-vpc-network-2"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "sda-firewall" {
  name = "sda-firewall"
  network = "${google_compute_network.vpc-network-1.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
}

resource "google_compute_instance" "sda1" {
  machine_type = "g1-small"
  name = "sda1"
  boot_disk {
    initialize_params {
      size = 30
      image = "ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc-network-1.self_link}"
    access_config {
      nat_ip = "${google_compute_address.ip-1.address}"
    }
  }
}


resource "google_compute_instance" "sda2" {
  machine_type = "g1-small"
  name = "sda2"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc-network-1.self_link}"
    }
}

resource "google_compute_instance" "sda3" {
  machine_type = "g1-small"
  name = "sda3"
  zone="asia-northeast1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc-network-2.self_link}"
  }
}