terraform {
  required_version = ">= 1.2.2"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.31.0"
    }
  }
}

## Authentication with terraform login
provider "tfe" {
}