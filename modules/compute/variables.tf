variable "unique_prefix" {
  type        = string
  description = "A unique string prefixed to names of the resources for ex environment name"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "product" {
  type        = string
  description = "Name of the product"
}

variable "ami" {
  type        = string
  description = "Prebuilt ami Id"
}

variable "instance_type" {
  type        = string
  default     = "m5.large"
  description = "Type of the instance"
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "Sg assigned to instances"
}

variable "key_name" {
  type        = string
  default     = null
  description = "SSH key attached to instances"
}

variable "iam_instance_profile" {
  type        = string
  default     = ""
  description = "Instance profile to attach to instance"
}

variable "subnets" {
  type        = list(string)
  description = "Used to set subnets for instance"
}

variable "min_size" {
  type        = number
  default     = 1
  description = "Used to set minimum number of instance to create"
}

variable "max_size" {
  type        = number
  default     = 0
  description = "Used to set minimum number of instance to create"
}

variable "desired_capacity" {
  type        = number
  default     = 0
  description = "Used to set desired number of instance to create"
}

variable "user_data" {
  type        = string
  default     = null
  description = "Used to pass in user data which is used when creating instances"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Enable public ip address for instances"
}

variable "target_group_arns" {
  type        = list(string)
  default     = []
  description = "Used to define target group arns"
}
