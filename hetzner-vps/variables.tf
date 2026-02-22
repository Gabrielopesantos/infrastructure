variable "hcloud_token" {
  description = "Hetzner Cloud Token"
  sensitive   = true
  type        = string
}

# Network Configuration
variable "network_name" {
  description = "Name of the private network"
  type        = string
  default     = "network1"
}

variable "network_cidr" {
  description = "CIDR range for the private network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "network_zone" {
  description = "Network zone for the subnet"
  type        = string
  default     = "eu-central"
}

variable "node1_private_ip" {
  description = "Private IP address for node1"
  type        = string
  default     = "10.0.1.2"
}

# Firewall Configuration
variable "enable_ping" {
  description = "Enable ICMP (ping) access"
  type        = bool
  default     = true
}

variable "enable_ssh" {
  description = "Enable SSH access"
  type        = bool
  default     = true
}

variable "ssh_port" {
  description = "SSH port"
  type        = string
  default     = "22"
}

variable "ssh_allowed_ips" {
  description = "List of IPs allowed to SSH (use 0.0.0.0/0 and ::/0 for all)"
  type        = list(string)
  default     = ["0.0.0.0/0", "::/0"]
}

variable "enable_http" {
  description = "Enable HTTP access"
  type        = bool
  default     = true
}

variable "enable_https" {
  description = "Enable HTTPS access"
  type        = bool
  default     = true
}

variable "custom_firewall_rules" {
  description = "List of custom firewall rules to add"
  type = list(object({
    description = string
    protocol    = string
    port        = string
    source_ips  = list(string)
  }))
  default = []
}

# Server Configuration
variable "server_name" {
  description = "Name of the server"
  type        = string
  default     = "node1"
}

variable "server_type" {
  description = "Server type (size)"
  type        = string
  default     = "cpx11"
}

variable "server_image" {
  description = "Server OS image"
  type        = string
  default     = "ubuntu-24.04"
}

variable "location" {
  description = "Server location"
  type        = string
  default     = "nbg1"
}

variable "ipv4_enabled" {
  description = "Enable IPv4"
  type        = bool
  default     = true
}

variable "ipv6_enabled" {
  description = "Enable IPv6"
  type        = bool
  default     = true
}

variable "ssh_key_name" {
  description = "Name for the SSH key in Hetzner"
  type        = string
  default     = "gabriel@casper"
}

variable "ssh_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "./ssh-pubkeys/casper.pub"
}

# Volume Configuration
variable "volume_size" {
  description = "Size of volumes in GB"
  type        = number
  default     = 10
}
