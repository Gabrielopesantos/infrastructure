<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.web_server_firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/1.48.0/docs/resources/firewall) | resource |
| [hcloud_network.network1](https://registry.terraform.io/providers/hetznercloud/hcloud/1.48.0/docs/resources/network) | resource |
| [hcloud_network_subnet.private_network1](https://registry.terraform.io/providers/hetznercloud/hcloud/1.48.0/docs/resources/network_subnet) | resource |
| [hcloud_server.node1](https://registry.terraform.io/providers/hetznercloud/hcloud/1.48.0/docs/resources/server) | resource |
| [hcloud_server_network.node1_private_network1](https://registry.terraform.io/providers/hetznercloud/hcloud/1.48.0/docs/resources/server_network) | resource |
| [hcloud_ssh_key.casper_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/1.48.0/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud Token | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_node1_internal_ip"></a> [node1\_internal\_ip](#output\_node1\_internal\_ip) | n/a |
| <a name="output_node1_ipv4"></a> [node1\_ipv4](#output\_node1\_ipv4) | n/a |
| <a name="output_node1_ipv6"></a> [node1\_ipv6](#output\_node1\_ipv6) | n/a |
<!-- END_TF_DOCS -->