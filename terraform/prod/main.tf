# commenting for pass a tests
# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   required_version = ">= 0.13"
# }

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  connection_private_key = var.connection_private_key
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  environment     = var.environment
  replicas        = var.replicas
  db_address      = module.db.external_ip_address_db
  provision       = false
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  connection_private_key = var.connection_private_key
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
  environment     = var.environment
  provision       = false
}
