# target roles
variable "target_role_arn" {
  description = "A list of full arn of iam roles to allow assuming"
  default     = []
}

# members
variable "members" {
  default = []
}

# description
variable "name" {
  description = "The logical name of group"
  default     = "group"
}

variable "stack" {
  description = "Text used to identify stack/environment of infrastructure"
  default     = ""
}

variable "desc" {
  description = "The extra description of group"
  default     = ""
}
