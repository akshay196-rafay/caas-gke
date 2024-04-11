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


## Node pool variables

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
  default     = "tiny-pool"
}


variable "node_version" {
  description = "The Kubernetes version of the nodes."
  type        = string
  default     = "1.27"
}

variable "node_count" {
  description = "The number of nodes per instance group."
  type        = number
  default     = 2
}

variable "autoscaling_min_node_count" {
  description = "Minimum number of nodes per zone in the NodePool."
  type        = number
  default     = 0
}

variable "autoscaling_max_node_count" {
  description = "Maximum number of nodes per zone in the NodePool."
  type        = number
  default     = 2
}

variable "autoscaling_total_min_node_count" {
  description = "Total minimum number of nodes in the NodePool."
  type        = number
  default     = 1
}

variable "autoscaling_total_max_node_count" {
  description = "Total maximum number of nodes in the NodePool."
  type        = number
  default     = 2
}

variable "autoscaling_location_policy" {
  description = "Location policy specifies the algorithm used when scaling-up the node pool."
  type        = string
  default     = "ANY"
}

variable "confidential_nodes_enabled" {
  description = "Enable Confidential GKE Nodes for this cluster."
  type        = bool
  default     = false
}

# variable "initial_node_count" {
#   description = "The initial number of nodes for the pool."
#   type        = number
#   default     = 0
# }

variable "management_auto_repair" {
  description = "Whether the nodes will be automatically repaired."
  type        = bool
  default     = false
}

variable "management_auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded."
  type        = bool
  default     = false
}

variable "max_pods_per_node" {
  description = "The maximum number of pods per node in this node pool."
  type        = number
  default     = 110
}

variable "network_config_enable_private_nodes" {
  description = "Enables or disables private nodes in the NodePool."
  type        = bool
  default     = false
}

variable "network_config_create_pod_range" {
  description = "Whether to create a new range for pod IPs in this node pool."
  type        = bool
  default     = false
}

variable "network_config_pod_ipv4_cidr_block" {
  description = "The IP address range for pod IPs in this node pool."
  type        = string
  default     = "10.104.0.0/14"
}

variable "node_config_machine_type" {
  description = "The name of a Google Compute Engine machine type."
  type        = string
  default     = "e2-standard-4"
}

variable "node_config_disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB."
  type        = number
  default     = 100
}

variable "node_config_image_type" {
  description = "The image type to use for this node."
  type        = string
  default     = "COS_CONTAINERD"
}

variable "node_config_disk_type" {
  description = "Type of the disk attached to each node."
  type        = string
  default     = "pd-standard"
}

variable "node_config_enable_ephemeral_storage" {
  description = "Enabling ephemeral storage will create a new range for pod IPs in this node pool."
  type        = bool
  default     = false
}

variable "node_config_local_ssd_count" {
  description = "The amount of local SSD disks that will be attached to each cluster node."
  type        = number
  default     = 0
}

variable "node_config_logging_variant" {
  description = "Parameter for specifying the type of logging agent used in a node pool."
  type        = string
  default     = "DEFAULT"
}

variable "node_config_gcfs_enabled" {
  description = "Enables the Google Container Filesystem (GCFS) on the node pool."
  type        = bool
  default     = false
}

variable "node_config_fast_socket_enabled" {
  description = "Enables fast socket on the node pool."
  type        = bool
  default     = false
}

variable "node_config_labels" {
  description = "The map of Kubernetes labels (key/value pairs) to be applied to each node."
  type        = map(string)
  default     = {}
}

variable "node_config_resource_labels" {
  description = "The resource labels for the node pool to use to annotate any related Google Compute Engine resources."
  type        = map(string)
  default     = {}
}

variable "node_config_metadata" {
  description = "The metadata key/value pairs assigned to instances in the pool."
  type        = map(string)
  default     = {"disable-legacy-endpoints": "true"}
}

variable "node_config_min_cpu_platform" {
  description = "The minimum CPU platform that all nodes in the pool will be created on."
  type        = string
  default     = ""
}

variable "node_config_reservation_affinity_consume_reservation_type" {
  description = "The configuration of the desired reservation which instances could take capacity from."
  type        = string
  default     = null
}

variable "node_config_reservation_affinity_key" {
  description = "The key for the reservation affinity."
  type        = string
  default     = null
}

variable "node_config_reservation_affinity_values" {
  description = "The list of possible values for the reservation affinity."
  type        = list(string)
  default     = []
}

variable "node_config_gvnic_enabled" {
  description = "Enables Google Virtual NIC (gVNIC) on the node pool."
  type        = bool
  default     = false
}

variable "node_config_enable_confidential_strorage" {
  description = "Enables Confidential VM on the node pool."
  type        = bool
  default     = false
}

variable "node_config_oauth_scopes" {
  description = "The set of Google API scopes to be made available on all of the node VMs."
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
}

variable "node_config_preemptible" {
  description = "A boolean that represents whether the underlying node VMs are preemptible."
  type        = bool
  default     = false
}

variable "node_config_spot" {
  description = "A boolean that represents whether the underlying node VMs are spot."
  type        = bool
  default     = false
}

variable "node_config_boot_disk_kms_key" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node."
  type        = string
  default     = null
}

variable "node_config_service_account" {
  description = "The service account to be used by the Node VMs."
  type        = string
  default     = ""
}

variable "node_config_tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(string)
  default     = []
}

variable "node_config_taint" {
  description = "A list of Kubernetes taints to apply to nodes."
  type = list(object({
    key      = string
    operator = string
    values   = list(string)
  }))
  default = []
}

variable "upgrade_settings_max_surge" {
  description = "The number of additional nodes that can be created beyond the current size of the node pool during the upgrade process."
  type        = number
  default     = 1
}

variable "upgrade_settings_max_unavailable" {
  description = "The number of nodes that can be simultaneously unavailable during the upgrade process."
  type        = number
  default     = 0
}

variable "upgrade_settings_strategy" {
  description = "The upgrade strategy to use for the node pool."
  type        = string
  default     = "SURGE"
}

