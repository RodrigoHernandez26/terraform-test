variable "env" {
    description = "Environment name."
    type        = string
}

variable "name" {
    description = "Bucket name."
    type        = string    
}

variable "versioning" {
    description = "Bucket versioning."
    type        = bool
    default     = false
}

variable "block_public_acls" {
    description = "Block public ACLs."
    type        = bool
    default     = true
}

variable "block_public_policy" {
    description = "Block public policy."
    type        = bool
    default     = true
}

variable "ignore_public_acls" {
    description = "Ignore public ACLs."
    type        = bool
    default     = true
}

variable "restrict_public_buckets" {
    description = "Restrict public buckets."
    type        = bool
    default     = true
}

variable "storage_unique_id" {
    description = "Internal storage of unique id for bucket names"
    type = any
    default = ""
}