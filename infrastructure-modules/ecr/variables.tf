variable "env" {
  type = string
}

variable "ecr_name" {
  description = "The name of ECR repository"
    type        = string
}

variable "image_mutability" {
  description = "The image mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
    type        = string
    default     = "MUTABLE"
}

variable "encrypt_type" {
  description = "Provide type of encryption. Must be one of: AES256 or KMS"
    type        = string
    default     = "KMS"
}

variable "tags" {
  description = "The key-value maps for tagging"
    type        = map(any)
    default     = {}
}