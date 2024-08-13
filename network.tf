# Firewall
resource "hcloud_firewall" "web_server_firewall" {
  name = "web-server"

  rule {
    description = "ping"
    direction   = "in"
    protocol    = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "SSH"
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "HTTP"
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
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

# Private Networks
resource "hcloud_network" "network1" {
  name     = "network1"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "private_network1" {
  network_id   = hcloud_network.network1.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server_network" "node1_private_network1" {
  server_id  = hcloud_server.node1.id
  network_id = hcloud_network.network1.id
  ip         = "10.0.1.2"
}
