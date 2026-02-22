# Hetzner VPS Infrastructure

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~>1.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.45.0 |

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.web_server_firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_network.network1](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network) | resource |
| [hcloud_network_subnet.private_network1](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet) | resource |
| [hcloud_server.node1](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.node1_private_network1](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |
| [hcloud_ssh_key.casper_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud Token | `string` | n/a | yes |
| <a name="input_custom_firewall_rules"></a> [custom\_firewall\_rules](#input\_custom\_firewall\_rules) | List of custom firewall rules to add | <pre>list(object({<br/>    description = string<br/>    protocol    = string<br/>    port        = string<br/>    source_ips  = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_http"></a> [enable\_http](#input\_enable\_http) | Enable HTTP access | `bool` | `true` | no |
| <a name="input_enable_https"></a> [enable\_https](#input\_enable\_https) | Enable HTTPS access | `bool` | `true` | no |
| <a name="input_enable_ping"></a> [enable\_ping](#input\_enable\_ping) | Enable ICMP (ping) access | `bool` | `true` | no |
| <a name="input_enable_ssh"></a> [enable\_ssh](#input\_enable\_ssh) | Enable SSH access | `bool` | `true` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Enable IPv4 | `bool` | `true` | no |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Enable IPv6 | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Server location | `string` | `"nbg1"` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | CIDR range for the private network | `string` | `"10.0.0.0/16"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the private network | `string` | `"network1"` | no |
| <a name="input_network_zone"></a> [network\_zone](#input\_network\_zone) | Network zone for the subnet | `string` | `"eu-central"` | no |
| <a name="input_node1_private_ip"></a> [node1\_private\_ip](#input\_node1\_private\_ip) | Private IP address for node1 | `string` | `"10.0.1.2"` | no |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | Server OS image | `string` | `"ubuntu-24.04"` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the server | `string` | `"node1"` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Server type (size) | `string` | `"cpx11"` | no |
| <a name="input_ssh_allowed_ips"></a> [ssh\_allowed\_ips](#input\_ssh\_allowed\_ips) | List of IPs allowed to SSH (use 0.0.0.0/0 and ::/0 for all) | `list(string)` | <pre>[<br/>  "0.0.0.0/0",<br/>  "::/0"<br/>]</pre> | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name for the SSH key in Hetzner | `string` | `"gabriel@casper"` | no |
| <a name="input_ssh_key_path"></a> [ssh\_key\_path](#input\_ssh\_key\_path) | Path to SSH public key file | `string` | `"./ssh-pubkeys/casper.pub"` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | SSH port | `string` | `"22"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | CIDR range for the subnet | `string` | `"10.0.1.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_cidr"></a> [network\_cidr](#output\_network\_cidr) | CIDR range of the private network |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the private network |
| <a name="output_node1_internal_ip"></a> [node1\_internal\_ip](#output\_node1\_internal\_ip) | Private network IP address of node1 |
| <a name="output_node1_ipv4"></a> [node1\_ipv4](#output\_node1\_ipv4) | Public IPv4 address of node1 |
| <a name="output_node1_ipv6"></a> [node1\_ipv6](#output\_node1\_ipv6) | Public IPv6 address of node1 |
<!-- END_TF_DOCS -->
