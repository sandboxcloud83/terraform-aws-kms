variable "alias_name" {
  description = "The name for the KMS key alias (without the 'alias/' prefix)."
  type        = string
}

variable "key_description" {
  description = "A description for the KMS key."
  type        = string
  default     = "KMS key managed by Terraform"
}

variable "key_policy_json" {
  description = "The key policy as a JSON string. If null, the default AWS key policy is used."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
