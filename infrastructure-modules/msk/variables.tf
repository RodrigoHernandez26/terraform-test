variable "env" {
    description = "Environment name"
    type    = string
}

variable "name" {
    description = "Name of the cluster"
  type    = string
}

variable "version" {
  description = "Kafka version"
    type    = string
    default = "3.3.2"
}

variable "subnet_ids" {
  description = "List of subnet IDs. Must be in at least two different availability zones."
  type        = list(string)
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default = "kafka.t3.small"
}

variable "storage_per_broker" {
  description = "The allocated storage in gigabytes."
  type        = number
  default     = 100
}

variable "security_group_ids" {
  description = "List of security group IDs to apply to the RDS instance."
  type        = list(string)
  default     = []
}
