output "external_ip_address_app" {
  value = [
    for vm in yandex_compute_instance.app:
      "VM name ${vm.name} has external IP: ${vm.network_interface.0.nat_ip_address}"
  ]
}

output "alb_address" {
  value = yandex_alb_load_balancer.reddit-balancer.listener.0.endpoint[0].address[0].external_ipv4_address
}
