resource "rafay_import_cluster" "gke" {
  clustername = var.cluster_name
  projectname = var.project_name
  blueprint   = "minimal"
  # location              = ""
  provision_environment = "CLOUD"
  kubernetes_provider   = "GKE"
  values_path           = "values.yaml"

  lifecycle {
    ignore_changes = [
      bootstrap_path,
      # values_path,
    ]
  }
}
