
terraform {
  required_providers {
    rafay = {
      version = "= 1.1.26"
      source  = "registry.terraform.io/RafaySystems/rafay"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }

  }
}
