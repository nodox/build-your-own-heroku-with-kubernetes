########################################################################
# Node pool
########################################################################

resource "google_container_node_pool" "micro" {
  name     = var.gke_node_pool_name
  location = var.gke_location
  cluster  = google_container_cluster.micro.name

  # 1 node per zone
  initial_node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = var.gke_node_is_preemptible
    machine_type = var.gke_node_types
    disk_size_gb = var.gke_node_disk_size

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

########################################################################
# GKE control plane
########################################################################

resource "google_container_cluster" "micro" {
  name               = var.gke_cluster_name
  location           = var.gke_location
  min_master_version = var.gke_version

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }
}
