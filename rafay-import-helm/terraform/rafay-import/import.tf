variable "cluster_name" {
  type        = string
  default     = "caas-import"
  description = "Name of the Rafay cluster"
}

variable "project_name" {
  type        = string
  default     = "akshay"
  description = "Rafay project name"
}

resource "rafay_import_cluster" "gke" {
  clustername           = var.cluster_name
  projectname           = var.project_name
  blueprint             = "minimal"
  # location              = ""
  provision_environment = "CLOUD"
  kubernetes_provider   = "GKE"
}

