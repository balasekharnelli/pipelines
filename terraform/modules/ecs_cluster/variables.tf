variable "ecs_cluster_name" {
  type        = string
  description = "The name of the cluster"
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "create_ecs_cluster" {
  description = "Controls if ECS should be created"
  type        = bool
}
