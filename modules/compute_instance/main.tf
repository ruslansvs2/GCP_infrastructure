# example https://github.com/terraform-google-modules/terraform-google-vm/tree/78cbf4f7d5dc6284f63d97f11461984cc5afd8a6/examples/mig/full

resource "google_compute_instance" "vm0" {
  name                      = var.instance_name
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = var.allow_stopping_for_update

  tags = var.tags

  boot_disk {
    initialize_params {
      image  = var.image
      labels = var.image_labels
    }
  }

  // Local SSD disk
  #  scratch_disk {
  #    interface = "SCSI"
  #  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet
    access_config {
      network_tier = var.network_tier
 #     nat_ip       = var.nat_ip
    }
  }
  can_ip_forward = var.can_ip_forward


  #  network_interface {
  #    network = "default"
  #    access_config {
  #      network_tier = "STANDARD"
  #  }
  #}

  metadata = var.metadata

  metadata_startup_script = var.startup_script
}