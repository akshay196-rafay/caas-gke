output "cluster_name" {
  value = rafay_import_cluster.gke.clustername
}

output "blueprint_name" {
  value = rafay_import_cluster.gke.blueprint
}

output "project_name" {
  value = rafay_import_cluster.gke.projectname
}

output "bootstrap_data" {
  value     = rafay_import_cluster.gke.bootstrap_data
  sensitive = true
}

output "bootstrap_path" {
  value = rafay_import_cluster.gke.bootstrap_path
}

output "manifest" {
  value = helm_release.bootstrap_apply.manifest
  sensitive = true
}
