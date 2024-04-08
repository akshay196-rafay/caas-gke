provider "helm" {
  kubernetes {
    # config_path = "~/.kube/config"

    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    token                  = var.cluster_access_token
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
}
