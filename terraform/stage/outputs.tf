output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}

output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

output "internal_ip_address_app" {
  value = module.app.internal_ip_address_app
}

output "internal_ip_address_db" {
  value = module.db.internal_ip_address_db
}

# output "alb_address" {
#   value = yandex_alb_load_balancer.reddit-balancer.listener.0.endpoint[0].address[0].external_ipv4_address
# }

# output "nlb_address" {
#   value = yandex_lb_network_load_balancer.reddit-nlb.listener.*.external_address_spec[0].*.address
# }
