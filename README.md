# Terraform AWS Module

This is an aws module to create a vanilla 3 tier setup. 

## Assumptions:

- The AWS resources are in Ireland region
- The VPC is created with the below setup 
    - 3 public subnets
    - 3 private subnets
    - 3 persistence subnets
    - N/W ACLs are added 
    - Route tables are updated accordingly with IGW for Public subnets & the NAT Gateways for the private subnets 
- Application is then deployed in the private subnets AZ's 
- ALB/NLB is created for the app & web layers

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app\_ami | Prebuilt ami Id for application | string | n/a | yes |
| cidr | A CIDR range for VPC | string | n/a | yes |
| environment | Name of the environment | string | n/a | yes |
| product | Name of the product | string | n/a | yes |
| ssh\_principals | SSH principals for ssh access | string | n/a | yes |
| unique\_prefix | A unique string prefixed to names of the resources for ex environment name | string | n/a | yes |
| web\_ami | Prebuilt ami Id for web | string | n/a | yes |
