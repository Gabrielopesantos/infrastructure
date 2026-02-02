output "node1_internal_ip" {
  description = "Private network IP address of node1"
  value       = hcloud_server_network.node1_private_network1.ip
}

output "node1_ipv4" {
  description = "Public IPv4 address of node1"
  value       = hcloud_server.node1.ipv4_address
}

output "node1_ipv6" {
  description = "Public IPv6 address of node1"
  value       = hcloud_server.node1.ipv6_address
}

output "network_id" {
  description = "ID of the private network"
  value       = hcloud_network.network1.id
}

output "network_cidr" {
  description = "CIDR range of the private network"
  value       = hcloud_network.network1.ip_range
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
