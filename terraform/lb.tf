# from small obj to big obj
# target group -> backend group -> http router -> vhost for router -> load balancer
resource "yandex_alb_target_group" "reddit-tg" {
  name      = "reddit-target-group"

  target {
    subnet_id    = var.subnet_id
    ip_address   = yandex_compute_instance.app.*.network_interface[0].*.ip_address[0]
  }
}

resource "yandex_alb_backend_group" "reddit-backend-group" {
  name      = "reddit-backend-group"

  http_backend {
    name = "reddit-http-backend"
    port = 9292
    target_group_ids = ["${yandex_alb_target_group.reddit-tg.id}"]
    http2 = "false"
  }
}

resource "yandex_alb_http_router" "reddit-router" {
  name      = "reddit-http-router"
}

resource "yandex_alb_virtual_host" "reddit-virtual-host" {
  name      = "reddit-virtual-host"
  http_router_id = yandex_alb_http_router.reddit-router.id
  route {
    name = "reddit-route"

    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.reddit-backend-group.id
      }
    }
  }
}

resource "yandex_alb_load_balancer" "reddit-balancer" {
  name        = "reddit-load-balancer"

  network_id  = "enpk78qonpeqv1q2uro2"

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = var.subnet_id
    }
  }

  listener {
    name = "reddit-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 80, 9292 ]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.reddit-router.id
      }
    }
  }
}
