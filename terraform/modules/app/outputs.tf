output "external_ip_address_app" {
  value = [
    for vm in yandex_compute_instance.app :
    "VM name ${vm.name} has external address: ${vm.network_interface.0.nat_ip_address}"
  ]
}

output "internal_ip_address_app" {
  value = [
    for vm in yandex_compute_instance.app :
    "VM name ${vm.name} has internal address: ${vm.network_interface[0].*.ip_address[0]}"
  ]
}
