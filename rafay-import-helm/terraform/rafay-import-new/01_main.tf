resource "rafay_import_cluster" "gke" {
  clustername           = var.cluster_name
  projectname           = var.project_name
  blueprint             = var.blueprint_name
  kubernetes_provider   = "GKE"
  provision_environment = "CLOUD"
  values_path           = "values.yaml"
  lifecycle {
    ignore_changes = [
      bootstrap_path
    ]
  }
}
