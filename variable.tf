variable "traffic_manager_profile_list" {
  type        = list(any)
  default     = []
  description = "list of traffic manager profile objects"
}

variable "resource_group_output" {
  type    = map(any)
  default = {}
  description = "Outputs of resource group objects "
}

variable "default_values" {
  type        = any
  default     = {}
  description = "Provide default values for resources if not any"
}