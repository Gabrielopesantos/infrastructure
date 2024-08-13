output "node1_internal_ip" {
  value = hcloud_server_network.node1_private_network1.ip
}

output "node1_ipv4" {
  value = hcloud_server.node1.ipv4_address
}

output "node1_ipv6" {
  value = hcloud_server.node1.ipv6_address
}

