# Firewall
resource "hcloud_firewall" "web_server_firewall" {
  name = "web-server"

  # ICMP (ping)
  dynamic "rule" {
    for_each = var.enable_ping ? [1] : []
    content {
      description = "ping"
      direction   = "in"
      protocol    = "icmp"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
  }

  # SSH
  dynamic "rule" {
    for_each = var.enable_ssh ? [1] : []
    content {
      description = "SSH"
      direction   = "in"
      protocol    = "tcp"
      port        = var.ssh_port
      source_ips  = var.ssh_allowed_ips
    }
  }

  # HTTP
  dynamic "rule" {
    for_each = var.enable_http ? [1] : []
    content {
      description = "HTTP"
      direction   = "in"
      protocol    = "tcp"
      port        = "80"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
  }

  # HTTPS
  dynamic "rule" {
    for_each = var.enable_https ? [1] : []
    content {
      description = "HTTPS"
      direction   = "in"
      protocol    = "tcp"
      port        = "443"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
  }

  # Custom ports
  dynamic "rule" {
    for_each = var.custom_firewall_rules
    content {
      description = rule.value.description
      direction   = "in"
      protocol    = rule.value.protocol
      port        = rule.value.port
      source_ips  = rule.value.source_ips
    }
  }
}

# Private Networks
resource "hcloud_network" "network1" {
  name     = var.network_name
  ip_range = var.network_cidr
}

resource "hcloud_network_subnet" "private_network1" {
  network_id   = hcloud_network.network1.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.subnet_cidr
}

resource "hcloud_server_network" "node1_private_network1" {
  server_id  = hcloud_server.node1.id
  network_id = hcloud_network.network1.id
  ip         = var.node1_private_ip
}
