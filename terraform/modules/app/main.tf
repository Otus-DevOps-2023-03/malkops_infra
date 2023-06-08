# commenting for pass a tests
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "app" {
  count = var.replicas
  name = "reddit-app-${count.index}"
  labels = {
    tags = "reddit-app"
    environment = var.environment
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      # reddit-base
      image_id = var.app_disk_image
    }
  }

  network_interface {
    # default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }

}

resource "null_resource" "app" {
  count = var.provision == true ? 1 : 0
  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    private_key = file(var.connection_private_key)
  }

  provisioner "file" {
    content     = templatefile("${path.module}/files/puma.service", { db_address = var.db_address })
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/deploy.sh"
  }
}
