# Heroku on Kubernetes Part 2: Create a GKE cluster with Terraform

Artifacts from our blog post.

## Requirements

You need the following components before you can provision your cluster.

- [GCP Account](https://cloud.google.com/)
- [gcloud-cli](https://cloud.google.com/sdk/docs#install_the_latest_cloud_tools_version_cloudsdk_current_version) >= 290.0.1
- [terraform](https://www.terraform.io/downloads.html)

## Getting Started with a cluster

- Start a new project
- Enable kubernetes api by going to the screen
- Create [service account credentials](https://console.cloud.google.com/iam-admin/serviceaccounts/create) for terraform.
- Apply the roles `Compute Viewer`, `Kubernetes Engine Cluster Admin`, and `Service Account User`
- Edit `main.auto.tfvars` with your information

```bash
export GOOGLE_CLOUD_KEYFILE_JSON=core.secret.json
terraform init
terraform plan
terraform apply

# fetch credentials
gcloud container clusters get-credentials micro
kubectl get pods -A
```
