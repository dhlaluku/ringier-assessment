
// Required Attributes

variable "vpc" {
  description = "ID of the vpc to attach the machine to"
  type        = string
}

variable "subnet" {
  description = "ID of the subnet in the vpc to attach the ec2 instance"
  type        = string
}

variable "keyname" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
  type        = string
}

// Optional Attributes

variable "region" {
  default     = "af-south-1"
  description = "The provider region"
  type        = string
}

variable "instance_type" {
  default     = "t3.nano"
  type        = string
  description = "The type of instance to deploy"
}

variable "instance_name" {
  default     = "default-ec2"
  description = "The name of the intance"
  type        = string
}

variable "is_graviton" {
  default     = false
  type        = bool
  description = "(Optional) Build Graviton based version of the instance"
}