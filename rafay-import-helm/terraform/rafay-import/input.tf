variable "cluster_name" {
  type        = string
  default     = "caas-import"
  description = "Name of the Rafay cluster"
}

variable "project_name" {
  type        = string
  default     = "defaultproject"
  description = "Rafay project name"
}

variable "cluster_endpoint" {
  type        = string
  description = "Cluster Endpoint URL"
}

variable "cluster_ca_certificate" {
  type        = string
  description = "Cluster CA Certificate"
}

variable "cluster_access_token" {
  type        = string
  description = "Cluster access token"
}
