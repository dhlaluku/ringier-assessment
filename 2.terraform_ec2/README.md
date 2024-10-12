## EC2 Bastion Instance
### Assumptions
- The user has an exisiting  VPC network defined in the deployment region and the ID of that network will be provided as an input variable. The module will create a VPC network if none is provided
- The VPC to attach to the bastion instance has atleast 1 subnet defined and its ID will supplied as input variable
- The ssh key is defined in AWS and will be supplied as input variable 

### How to Use this module
In the current working working directory, create your `terraform.tfvars` files with the following required attributes
```bash
vpc           = "<your vpc ID>" # The ID of the VPC in the region where the EC2 instance is built. The default VPC should suffice for this execise
subnet        = "<subnet Id in the VPC>" # Should be defined in the VPC thats being used for the EC2
keyname       = "<ssh keyname>" # Should available in AWS EC ssh keys
```

If the user wants to build a graviton based EC2 instance, specify the `is_graviton` variable in the `terraform.tfvars` file and set it to true. The dafult option is false and builds the `AMD/x86_64` based architecture

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | ./modules/ec2 | n/a |
| <a name="module_ec2-instance-graviton"></a> [ec2-instance-graviton](#module\_ec2-instance-graviton) | ./modules/ec2 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.security](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/security_group) | resource |
| [aws_ami.ami](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/ami) | data source |
| [aws_ami.ami_arm](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/caller_identity) | data source |
| [aws_key_pair.key_name](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/key_pair) | data source |
| [aws_subnet.subnet_id](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/subnet) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the intance | `string` | `"default-ec2"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to deploy | `string` | `"t3.nano"` | no |
| <a name="input_is_graviton"></a> [is\_graviton](#input\_is\_graviton) | (Optional) Build Graviton based version of the instance | `bool` | `false` | no |
| <a name="input_keyname"></a> [keyname](#input\_keyname) | Key name of the Key Pair to use for the instance; which can be managed using the aws\_key\_pair resource. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The provider region | `string` | `"af-south-1"` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | ID of the subnet in the vpc to attach the ec2 instance | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The default tags to attach to all the reources with this module | `map` | `{}` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | ID of the vpc to attach the machine to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->