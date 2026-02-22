resource "hcloud_server" "node1" {
  name        = var.server_name
  image       = var.server_image
  server_type = var.server_type
  location    = var.location

  ssh_keys = [
    hcloud_ssh_key.casper_ssh_key.id
  ]

  firewall_ids = [
    hcloud_firewall.web_server_firewall.id,
  ]

  public_net {
    ipv4_enabled = var.ipv4_enabled
    ipv6_enabled = var.ipv6_enabled
  }
}

resource "hcloud_ssh_key" "casper_ssh_key" {
  name       = var.ssh_key_name
  public_key = file(var.ssh_key_path)
}
