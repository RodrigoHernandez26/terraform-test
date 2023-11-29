variable "env" {
  description = "Environment name."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets."
  type        = list(string)

}

variable "private_subnets" {
  description = "CIDR ranges for private subnets."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR ranges for public subnets."
  type        = list(string)
}

variable "private_subnet_tags" {
  description = "Private subnets tags."
  type        = map(any)
}

variable "public_subnet_tags" {
  description = "Public subnets tags."
  type        = map(any)
}