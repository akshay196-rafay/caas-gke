output "cluster_name" {
  value = var.cluster_name
}

output "cluster_endpoint" {
  value     = "https://${data.google_container_cluster.gke_cluster.endpoint}"
  # sensitive = true
}

output "cluster_ca_certificate" {
  value     = data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate
  # sensitive = true
}

output "cluster_access_token" {
  value     = data.google_client_config.default.access_token
  sensitive = true
}
