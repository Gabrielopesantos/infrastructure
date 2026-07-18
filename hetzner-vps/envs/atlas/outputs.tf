output "server_internal_ip" {
  description = "Private network IP address of the server"
  value       = module.vps.server_internal_ip
}

output "server_ipv4" {
  description = "Public IPv4 address of the server"
  value       = module.vps.server_ipv4
}

output "server_ipv6" {
  description = "Public IPv6 address of the server"
  value       = module.vps.server_ipv6
}

output "network_id" {
  description = "ID of the private network"
  value       = module.vps.network_id
}

output "network_cidr" {
  description = "CIDR range of the private network"
  value       = module.vps.network_cidr
}
