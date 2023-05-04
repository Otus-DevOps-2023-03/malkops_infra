# from small to big obj
# target group -> load balancer

resource "yandex_lb_target_group" "reddit-tg" {
  name      = "reddit-target-group"
  region_id = "ru-central1"

  target {
    subnet_id = var.subnet_id
    address   = yandex_compute_instance.app.0.network_interface[0].*.ip_address[0]
  }

  target {
    subnet_id = var.subnet_id
    address   = yandex_compute_instance.app.1.network_interface[0].*.ip_address[0]
  }
}

resource "yandex_lb_network_load_balancer" "reddit-nlb" {
  name = "reddit-network-load-balancer"

  listener {
    name = "reddit-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.reddit-tg.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
