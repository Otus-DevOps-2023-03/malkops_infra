variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "connection_private_key" {
  description = "Path to the private key used for provisioning"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}

variable subnet_id {
  description = "Subnets for modules"
}

variable "environment" {
  description = "App environment"
  default = "test"
}
