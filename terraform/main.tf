terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "/home/user/key_terraform.json"
  cloud_id  = "b1g7e1btd6bq7ljelkvk"
  folder_id = "b1g0djaur4q9c0kumsj0"
  zone      = "ru-central1-a"
}
