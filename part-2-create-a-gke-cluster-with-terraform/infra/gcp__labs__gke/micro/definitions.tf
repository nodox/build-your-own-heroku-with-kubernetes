variable "core_project_id" {
  type = string
}

variable "core_region" {
  type = string
}
variable "core_zone" {
  type = string
}

variable "gke_cluster_name" {
  type = string
}
variable "gke_node_pool_name" {
  type = string
}

variable "gke_location" {
  type = string
}

variable "gke_node_types" {
  type = string
}

variable "gke_node_is_preemptible" {
  type = bool
}

variable "gke_node_disk_size" {
  type = number
}
variable "gke_version" {
  type = string
}

variable "gke_autoscaling_min" {
  type = number
}

variable "gke_autoscaling_max" {
  type = number
}

variable "gke_node_locations" {
  type = list(string)
}
