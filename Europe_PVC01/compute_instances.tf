module "vm00" {
  source                    = "../modules/compute_instance"
  instance_name             = "vm0"
  machine_type              = "e2-micro"
  zone                      = "europe-central2-a"
  allow_stopping_for_update = true

  image          = "debian-cloud/debian-11"
  network        = google_compute_network.vpc_europe_01.name
  subnet         = google_compute_subnetwork.subnet_e01.name
  network_tier   = "STANDARD"
  startup_script = "echo hi > /test.txt"

}

#  network_interface {
#    network = "default"
#    access_config {
#      network_tier = "STANDARD"
#  }
#}

#  metadata = {
#    foo = "bar"
#  }
