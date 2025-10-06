terraform {
  required_version = ">= 1.6.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.40.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.40.0"
    }
  }
}

provider "google" {
  project = "meal-planner-474313"
  region  = "europe-west3"
}

provider "google-beta" {
  project = "meal-planner-474313"
  region  = "europe-west3"
}
