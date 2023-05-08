output "external_ip_address_db" {
  value = "DB has external address: ${yandex_compute_instance.db.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_db" {
  value = "DB has internal address: ${yandex_compute_instance.db.network_interface[0].*.ip_address[0]}"
}
