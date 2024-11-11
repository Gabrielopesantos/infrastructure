terraform {
  required_version = ">= 1.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.49.0"
    }
  }

  cloud {
    organization = "SantosLabs"

    workspaces {
      name = "infrastructure"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
