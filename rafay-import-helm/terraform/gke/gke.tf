resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "default" # google_compute_network.vpc.name
  subnetwork = "default" # google_compute_subnetwork.subnet.name

  project = var.project_id

  release_channel {
    channel = "UNSPECIFIED"
  }
  min_master_version = var.min_master_version

  networking_mode   = var.networking_mode
  ip_allocation_policy {}
}


resource "google_container_node_pool" "primary_nodes" {
  depends_on = [
    google_container_cluster.primary,
  ]
  # for_each   = local.node_pool_map
  cluster           = google_container_cluster.primary.id

  name              = var.node_pool_name
  node_count        = var.node_count
  version           = var.node_version
  max_pods_per_node = var.max_pods_per_node

  autoscaling {
    min_node_count       = var.autoscaling_min_node_count
    max_node_count       = var.autoscaling_max_node_count
    # total_min_node_count = var.autoscaling_total_min_node_count
    # total_max_node_count = var.autoscaling_total_max_node_count
    # location_policy      = var.autoscaling_location_policy
  }

  management {
    # auto_repair  = var.management_auto_repair
    auto_upgrade = var.management_auto_upgrade
  }

  # network_config {
  #   create_pod_range     = var.network_config_create_pod_range
  #   enable_private_nodes = var.network_config_enable_private_nodes
  #   pod_ipv4_cidr_block  = var.network_config_pod_ipv4_cidr_block
  # }

  node_config {
    machine_type = var.node_config_machine_type
    image_type   = var.node_config_image_type
    disk_type    = var.node_config_disk_type
    disk_size_gb = var.node_config_disk_size_gb
    # fast_socket {
    #   enabled = var.node_config_fast_socket_enabled
    # }

    # logging_variant = var.node_config_logging_variant
    
    gcfs_config {
      enabled = var.node_config_gcfs_enabled
    }

    labels           = var.node_config_labels
    resource_labels  = var.node_config_resource_labels
    local_ssd_count  = var.node_config_local_ssd_count
    metadata         = var.node_config_metadata
    # min_cpu_platform = var.node_config_min_cpu_platform
    oauth_scopes     = var.node_config_oauth_scopes
    # preemptible      = var.node_config_preemptible

    # boot_disk_kms_key = var.node_config_boot_disk_kms_key == null ? null : var.node_config_boot_disk_kms_key

    # dynamic "advanced_machine_features" {
    #   for_each = var.node_config_advanced_machine_features_threads_per_core != null ? [1] : []
    #   content {
    #     threads_per_core = var.node_config_advanced_machine_features_threads_per_core
    #   }
    # }

    # dynamic "reservation_affinity" {
    #   for_each = var.node_config_reservation_affinity_consume_reservation_type == "SPECIFIC_RESERVATION" ? [1] : []
    #   content {
    #     consume_reservation_type = var.node_config_reservation_affinity_consume_reservation_type
    #     key                      = var.node_config_reservation_affinity_key
    #     values                   = var.node_config_reservation_affinity_values
    #   }
    # }

    # dynamic "workload_metadata_config" {
    #   for_each = var.node_config_workload_metadata_config_mode != null ? [1] : []
    #   content {
    #     mode = var.node_config_workload_metadata_config_mode
    #   }
    # }
  }
}
