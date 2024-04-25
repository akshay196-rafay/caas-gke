data "google_client_config" "default" {}

data "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  project = var.project_id
}


provider "helm" {
  kubernetes {
    # config_path = "~/.kube/config"

    host                   = "https://${data.google_container_cluster.gke_cluster.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token

    # exec {
    #   api_version = "client.authentication.k8s.io/v1beta1"
    #   command     = "aws"
    #   # This requires the awscli to be installed locally where Terraform is executed
    #   args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.id]
    # }
  }
  debug = true
}

resource "helm_release" "my_release" {
  depends_on = [rafay_import_cluster.gke]

  name             = "v2-infra"
  namespace        = "rafay-system"
  create_namespace = true
  repository       = "https://rafaysystems.github.io/rafay-helm-charts/"
  chart            = "v2-infra"
  values           = [rafay_import_cluster.gke.values_data]
  version          = "1.1.2"

  lifecycle {
    ignore_changes = [
      values,
      version
    ]
  }
}
