terraform {
  required_version = ">= 1.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~>1.66.1"
    }
  }

  backend "s3" {
    bucket = "santoslabs-tfstate"
    key    = "hetzner-vps/atlas/terraform.tfstate"
    region = "auto"

    endpoints = {
      s3 = "https://b9242f38ea4f6f960333c4b68fc884b1.r2.cloudflarestorage.com"
    }

    use_path_style              = true # R2 bucket-in-path (bucket.r2...) instead of virtual-hosted-style subdomains
    skip_credentials_validation = true # R2 has no STS; skip the AWS-only GetCallerIdentity check
    skip_region_validation      = true # "auto" isn't a real AWS region, don't validate it against AWS's list
    skip_requesting_account_id  = true # no AWS account ID to look up on R2
    skip_s3_checksum            = true # R2 rejects the AWS SDK's default checksum trailer
    use_lockfile                = true # native state locking (Terraform >=1.10)
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
