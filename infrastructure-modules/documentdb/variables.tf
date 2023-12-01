variable "env" {
  description = "Environment name."
  type        = string
}

variable "cluster_name" {
  description = "Name of de DocumentDB cluster"
  type        = string
}

variable "username" {
  description = "Username for the DocumentDB cluster"
  type        = string
}

variable "password" {
  description = "Password for the DocumentDB cluster"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the DocumentDB cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs. Must be in at least two different availability zones."
  type        = list(string)
}

variable "instance_count" {
  description = "Number of instances to create."
  type        = number
  default     = 1
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "List of security group IDs to apply to the RDS instance."
  type        = list(string)
  default     = []
}