output "external_ip_address_app" {
  value = [
    for vm in yandex_compute_instance.app :
    "VM name ${vm.name} has external IP: ${vm.network_interface.0.nat_ip_address}"
  ]
}

output "external_ip_address_app111" {
  value = [
    for vm in yandex_compute_instance.app :
    "VM name ${vm.name} has internal IP: ${vm.network_interface[0].*.ip_address[0]}"
  ]
}

# output "alb_address" {
#   value = yandex_alb_load_balancer.reddit-balancer.listener.0.endpoint[0].address[0].external_ipv4_address
# }

output "nlb_address" {
  value = yandex_lb_network_load_balancer.reddit-nlb.listener.*.external_address_spec[0].*.address
}
