variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "connection_private_key" {
  description = "Path to the private key used for provisioning"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable subnet_id {
  description = "Subnets for modules"
}

variable "environment" {
  description = "App environment"
  default = "test"
}

variable "replicas" {
  description = "Amount of replicas"
}

variable "db_address" {
  description = "Database ip address"
}

variable "provision" {
  description = "Is necessary provisioning"
  default = "false"
}
