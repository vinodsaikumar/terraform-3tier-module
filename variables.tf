variable "unique_prefix" {
  type        = string
  description = "A unique string prefixed to names of the resources for ex environment name"
}

variable "cidr" {
  type        = string
  description = "A CIDR range for VPC"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "product" {
  type        = string
  description = "Name of the product"
}

variable "ssh_principals" {
  type        = string
  description = "SSH principals for ssh access"
}

variable "app_ami" {
  type        = string
  description = "Prebuilt ami Id for application"
}

variable "web_ami" {
  type        = string
  description = "Prebuilt ami Id for web"
}
