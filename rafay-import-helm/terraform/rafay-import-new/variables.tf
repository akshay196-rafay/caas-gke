variable "cluster_name" {
  description = "rafay eks cluster name"
  type        = string
  default     = "caas-standard-local"
}
variable "project_name" {
  description = "rafay project name"
  type        = string
  default     = "defaultproject"
}
variable "blueprint_name" {
  description = "rafay blueprint name"
  type        = string
  default     = "minimal"
}

variable "project_id" {
  description = "GCP project id"
  type        = string
  default     = "dev-382813"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}
