resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = false
  initial_node_count       = 1

  network    = "default" # google_compute_network.vpc.name
  subnetwork = "default" # google_compute_subnetwork.subnet.name

  project = var.project_id

  release_channel {
    channel = "UNSPECIFIED"
  }
  min_master_version = var.min_master_version
}


data "google_client_config" "default" {}

data "google_container_cluster" "gke_cluster" {
  depends_on = [
    # GKE cluster must be created before fetching cluster details.
    google_container_cluster.primary,
  ]

  name     = var.cluster_name
  location = var.region

  project = var.project_id
}



# Call rafay import module.
# module "rafay_import" {
#   # depends_on = [
#   #   # GKE cluster must be created and cluster details must be fetched
#   #   # before importing cluster to Rafay controller.
#   #   data.google_container_cluster.gke_cluster,
#   # ]
#   source = "../rafay-import"

#   cluster_name           = var.cluster_name
#   cluster_endpoint       = "https://${data.google_container_cluster.gke_cluster.endpoint}"
#   cluster_ca_certificate = data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate
#   cluster_access_token   = data.google_client_config.default.access_token
# }
