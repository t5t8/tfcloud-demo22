terraform {
  required_version = ">= 1.2.6"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.35.0"
    }
  }
}

## Authentication with terraform login
provider "tfe" {
}