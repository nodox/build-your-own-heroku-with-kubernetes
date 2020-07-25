### Variables to be automatically substituted

core_project_id = "YOUR_PROJECT"
core_region = "us-central1"
core_zone = "us-central1-a"

gke_location = "us-central1-a"
gke_node_types = "e2-standard-4"
gke_node_disk_size = 60
gke_node_is_preemptible = true

gke_autoscaling_min = 0
gke_autoscaling_max = 1

gke_cluster_name = "micro"
gke_node_pool_name = "micro"
gke_version = "1.16"
gke_node_locations = [
  "us-central1-b",
]