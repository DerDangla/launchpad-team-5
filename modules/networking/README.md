# Networking Module

The Networking module creates a VPC infrastructure setup with public and private subnets, routing, and security for an AWS environment. It provisions a VPC with DNS support and hostnames enabled, multiple public and private subnets, and a security group to allow PostgreSQL database traffic. It also includes an internet gateway and sets up routing tables to manage public internet access for the public subnets.

## Inputs

| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones for the VPC subnets | `list(string)` | n/a | yes |

