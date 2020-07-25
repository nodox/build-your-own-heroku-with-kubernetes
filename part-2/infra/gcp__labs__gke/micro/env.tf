########################################################################
# ENV
########################################################################
provider "google" {
  project = var.core_project_id
  region = var.core_region
  version = "3.21.0"
}

provider "google-beta" {
  project = var.core_project_id
  region = var.core_region
  version = "3.21.0"
}

terraform {
  required_version = ">= 0.12.0"
}
