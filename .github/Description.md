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
