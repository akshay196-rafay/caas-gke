provider "helm" {
  kubernetes {
    # config_path = "~/.kube/config"

    host                   = "https://${data.google_container_cluster.gke_cluster.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
  debug = true
  experiments {
    manifest = true
  }
}

resource "helm_release" "bootstrap_apply" {
  depends_on = [
    rafay_import_cluster.gke,
  ]

  name             = "v2-infra"
  namespace        = "rafay-system"
  create_namespace = true
  repository       = "https://rafaysystems.github.io/rafay-helm-charts/"
  chart            = "v2-infra"
  values           = [rafay_import_cluster.gke.values_data]
  version          = "1.1.2"

  # lifecycle {
  #   ignore_changes = [
  #     # skip any day2 apply
  #     manifest,
  #     # though the version is 1.1.2, but changing to v1.0 to 1.1.2 on
  #     # every terraform apply
  #     version,
  #   ]
  #   ignore_changes = all
  # }
}
