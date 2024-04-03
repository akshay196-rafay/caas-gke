variable "region" {
  default     = "us-central1"
  description = "name of region"
}

variable "project_id" {
  default     = "dev-382813"
  description = "GCP project"
}

variable "cluster_name" {
  default     = "caas-standard"
  description = "GCP project"
}

variable "min_master_version" {
  default     = "1.27"
  description = "Initial master k8s version"
}
