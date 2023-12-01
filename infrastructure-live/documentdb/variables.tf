variable "env" {
  description = "Environment name."
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = string
}