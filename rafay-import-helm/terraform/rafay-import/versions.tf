terraform {
  required_providers {
    rafay = {
      version = ">= 1.1.26"
      source  = "registry.terraform.io/RafaySystems/rafay"
    }

    helm = {
      version = ">= 2.12.1"
      source  = "registry.terraform.io/hashicorp/helm"
    }
  }

  required_version = ">= 0.14"
}
