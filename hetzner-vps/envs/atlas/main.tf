module "vps" {
  source = "../../modules/vps"

  server_name = "atlas"
  server_type = "cx23"
  location    = "fsn1"

  ssh_public_key = file("../../ssh-pubkeys/gabriel.pub")
}
