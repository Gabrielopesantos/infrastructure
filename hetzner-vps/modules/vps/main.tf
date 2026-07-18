resource "hcloud_server" "this" {
  name        = var.server_name
  image       = var.server_image
  server_type = var.server_type
  location    = var.location

  ssh_keys = [
    hcloud_ssh_key.this.id
  ]

  firewall_ids = [
    hcloud_firewall.this.id,
  ]

  public_net {
    ipv4_enabled = var.ipv4_enabled
    ipv6_enabled = var.ipv6_enabled
  }

  labels = var.labels
}

resource "hcloud_ssh_key" "this" {
  name       = var.ssh_key_name
  public_key = var.ssh_public_key
  labels     = var.labels
}
