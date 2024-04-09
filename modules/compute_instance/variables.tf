variable "instance_name" {
  description = "Name of the instance"
}

variable "machine_type" {
  description = "Machine type for the instance"
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone where the instance will be located"
  default     = "europe-central2-a"
}

variable "tags" {
  description = "List of tags for the instance"
  default     = ["deafult", "zone"]
}

variable "image" {
  description = "Image for the boot disk"
  default     = "debian-cloud/debian-11"
}

variable "image_labels" {
  #  type        = map()
  description = "Labels for the boot disk image"
  default     = { my_label = "value" }
}

variable "network" {
  description = "Name of the network for the instance"
}

variable "subnet" {
  description = "Name of the subnet for the instance"
}

variable "network_tier" {
  description = "Network tear"
  default     = null
}

variable "nat_ip" {
  description = "public IP addess"
  default     = null
}

variable "can_ip_forward" {
  description = "Enable IP forwarding, for NAT instances for example"
  default     = "false"
}

variable "startup_script" {
  description = "Startup script for the instance"
  default     = "echo hi > /test.txt"
}

variable "metadata" {
  type        = map(string)
  description = "Metadata, provided as a map"
  default     = {}
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "Allow stopping for update"
  default     = false

}