terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.74.0"
    }

    template = {
      source   = "hashicorp/template"
      version  = "2.2.0"
    }
  }

  required_version = ">= 0.14"
}

