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

locals {
  depends_on = [
    rafay_import_cluster.gke,
  ]
  bs_data = resource.rafay_import_cluster.gke.bootstrap_data
}

resource "helm_release" "bootstrap_apply" {
  depends_on = [
    rafay_import_cluster.gke,
  ]
  name       = "bootstrap-rel"
  repository = "../../helm-charts"
  chart      = "bootstrap"

  values = [
    "yaml: |\n%{for line in split("\n", local.bs_data)}  ${line}\n%{endfor}",
  ]
}
