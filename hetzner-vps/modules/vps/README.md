# VPS module

Reusable Hetzner Cloud VPS: one server, one private network, one firewall. Instantiated per environment from `hetzner-vps/envs/<name>/`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~>1.66.1 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | ~>1.66.1 |

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_network.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network) | resource |
| [hcloud_network_subnet.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet) | resource |
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |
| [hcloud_ssh_key.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH public key content (e.g. file("path/to/key.pub") from the caller) | `string` | n/a | yes |
| <a name="input_custom_firewall_rules"></a> [custom\_firewall\_rules](#input\_custom\_firewall\_rules) | List of custom firewall rules to add | <pre>list(object({<br/>    description = string<br/>    protocol    = string<br/>    port        = string<br/>    source_ips  = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_http"></a> [enable\_http](#input\_enable\_http) | Enable HTTP access | `bool` | `true` | no |
| <a name="input_enable_https"></a> [enable\_https](#input\_enable\_https) | Enable HTTPS access | `bool` | `true` | no |
| <a name="input_enable_ping"></a> [enable\_ping](#input\_enable\_ping) | Enable ICMP (ping) access | `bool` | `true` | no |
| <a name="input_enable_ssh"></a> [enable\_ssh](#input\_enable\_ssh) | Enable SSH access | `bool` | `true` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Enable IPv4 | `bool` | `true` | no |
| <a name="input_ipv6_enabled"></a> [ipv6\_enabled](#input\_ipv6\_enabled) | Enable IPv6 | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels applied to every labelable resource (server, ssh key, firewall, network) | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Server location | `string` | `"nbg1"` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | CIDR range for the private network | `string` | `"10.0.0.0/16"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the private network | `string` | `"network1"` | no |
| <a name="input_network_zone"></a> [network\_zone](#input\_network\_zone) | Network zone for the subnet | `string` | `"eu-central"` | no |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | Server OS image | `string` | `"ubuntu-26.04"` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the server | `string` | `"node1"` | no |
| <a name="input_server_private_ip"></a> [server\_private\_ip](#input\_server\_private\_ip) | Private network IP address for the server | `string` | `"10.0.1.2"` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Server type (size) | `string` | `"cpx11"` | no |
| <a name="input_ssh_allowed_ips"></a> [ssh\_allowed\_ips](#input\_ssh\_allowed\_ips) | List of IPs allowed to SSH (use 0.0.0.0/0 and ::/0 for all) | `list(string)` | <pre>[<br/>  "0.0.0.0/0",<br/>  "::/0"<br/>]</pre> | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name for the SSH key in Hetzner | `string` | `"gabriel@casper"` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | SSH port | `string` | `"22"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | CIDR range for the subnet | `string` | `"10.0.1.0/24"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_network_cidr"></a> [network\_cidr](#output\_network\_cidr) | CIDR range of the private network |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the private network |
| <a name="output_server_internal_ip"></a> [server\_internal\_ip](#output\_server\_internal\_ip) | Private network IP address of the server |
| <a name="output_server_ipv4"></a> [server\_ipv4](#output\_server\_ipv4) | Public IPv4 address of the server |
| <a name="output_server_ipv6"></a> [server\_ipv6](#output\_server\_ipv6) | Public IPv6 address of the server |
<!-- END_TF_DOCS -->
