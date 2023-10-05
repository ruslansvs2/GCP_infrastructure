
# IP
#resource "google_compute_address" "static-vm0" {
#  name = "static-ip-vm0"
#  address_type = "EXTERNAL"
#}

# Create a VPC network
resource "google_compute_network" "vpc_europe_01" {
  name                    = "network-vpc-europe01"
  auto_create_subnetworks = "false"
}

# Create a subnet in the VPC with custom range
resource "google_compute_subnetwork" "subnet_e01" {
  name          = "subnetwork-vpc-europe01"
  ip_cidr_range = "10.84.1.0/24"
  region        = "europe-central2"
  network       = google_compute_network.vpc_europe_01.self_link
}

### Route 
resource "google_compute_route" "route_table_vpc_europe_01" {
  name             = "internet-access"
  network          = google_compute_network.vpc_europe_01.self_link
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"

}

### Firewall 
resource "google_compute_firewall" "default_ingress" {
  name          = "allow-ssh"
  network       = google_compute_network.vpc_europe_01.name
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_all_egress" {
  name      = "allow-all"
  network   = google_compute_network.vpc_europe_01.name
  direction = "EGRESS"
  priority  = 1000
  #  target_tags = ["allowall"]
  destination_ranges = ["0.0.0.0/0"]
  source_ranges      = ["10.84.1.0/24"]
  allow {
    protocol = "icmp"
    #   ports = ["0-65535"]
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}
