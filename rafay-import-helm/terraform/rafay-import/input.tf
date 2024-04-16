variable "region" {
  default     = "us-central1"
  description = "name of region"
}

variable "project_id" {
  default     = "dev-382813"
  description = "GCP project"
}

variable "cluster_name" {
  type        = string
  default     = "caas-standard"
  description = "Name of the cluster"
}

variable "project_name" {
  type        = string
  default     = "defaultproject"
  description = "Rafay project name"
}
