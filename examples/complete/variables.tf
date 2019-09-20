
variable "aws_account_id" {
  description = "The aws account id for the tf backend creation (e.g. 857026751867)"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

# target roles
variable "target_role_arn" {
  description = "A list of full arn of iam roles to allow assuming"
  default     = []
}

# description
variable "name" {
  description = "The logical name of role"
  default     = "role"
}

variable "stack" {
  description = "Text used to identify stack/environment of infrastructure"
  default     = ""
}

variable "desc" {
  description = "The extra description of role"
  default     = ""
}
