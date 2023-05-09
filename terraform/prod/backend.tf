terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "malkops-tfstate"
    region     = "ru-central1"
    key        = "terraform/prod/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
