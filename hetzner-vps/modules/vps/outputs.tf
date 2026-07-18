output "server_internal_ip" {
  description = "Private network IP address of the server"
  value       = hcloud_server_network.this.ip
}

output "server_ipv4" {
  description = "Public IPv4 address of the server"
  value       = hcloud_server.this.ipv4_address
}

output "server_ipv6" {
  description = "Public IPv6 address of the server"
  value       = hcloud_server.this.ipv6_address
}

output "network_id" {
  description = "ID of the private network"
  value       = hcloud_network.this.id
}

output "network_cidr" {
  description = "CIDR range of the private network"
  value       = hcloud_network.this.ip_range
}

# Uncomment when volumes are created
# output "data_volume_id" {
#   description = "ID of the data volume"
#   value       = hcloud_volume.data_volume.id
# }
#
# output "data_volume_linux_device" {
#   description = "Device path for the data volume"
#   value       = hcloud_volume.data_volume.linux_device
# }
