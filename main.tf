resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "ubuntu-24.04"
  server_type = "cpx11"
  location    = "nbg1"

  ssh_keys = [
    hcloud_ssh_key.casper_ssh_key.id
  ]

  firewall_ids = [
    hcloud_firewall.web_server_firewall.id,
  ]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

resource "hcloud_ssh_key" "casper_ssh_key" {
  name       = "gabriel@casper"
  public_key = file("./ssh-pubkeys/casper.pub")
}

