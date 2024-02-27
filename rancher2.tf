provider "rancher2" {
  # alias = "admin"
  api_url = "https://172.16.1.147"
  access_key = "token-xmhfj"
  secret_key = "jhvlw9zf6bd88tvzkd6kdl7t2lxc9jvftbglsswrtdkp76t5pbnc8x"
  insecure = true

}

provider "cloudstack" {
  api_url      = "http://10.0.0.102:8080/client/api"
  api_key      = "VE7yc8cI4lWyH9OqZwDIFGLkbqqRRot2kGD3rzAburKjJqWAtYNpALbD_QXWa7ELuqTt0f1nbOa8SdBWYETYTg"
  secret_key   = "wPNJnB2NqjTARfq1LnfkWlVyWAyNAms8dfIEB9GyN-jUdEaWi3Rs82LM1VMZ9rtoVXGWlHvJdeLoUWZxMn093g"
}


resource "cloudstack_instance" "master" {
  // name             = "db-infra"
  // count = var.instance_count
  name  = "hr12345-master2111"
  service_offering = "basic1-nested"
  template         = "ub2004kvmimgnodisk"
  zone             = "W-AZ1"
  network_id       = "f1eb6908-5ce3-4639-8a2d-a4f7b330f257"
  security_group_ids = ["465c86e3-0413-41cb-9167-7879964c6b19"]
  keypair = "git-runner-104"
  root_disk_size   = 30
  user_data        = base64encode(data.template_file.user_data_master.rendered)
  # ip_address     = "172.16.1.127"
  expunge          = true

}


resource "cloudstack_instance" "worker" {
  // name             = "db-infra"
  // count = var.instance_count
  name  = "hr12345-worker2111"
  service_offering = "basic1-nested"
  template         = "ub2004kvmimgnodisk"
  zone             = "W-AZ1"
  network_id       = "f1eb6908-5ce3-4639-8a2d-a4f7b330f257"
  security_group_ids = ["465c86e3-0413-41cb-9167-7879964c6b19"]
  keypair          = "git-runner-104"
  root_disk_size   = 30
  user_data        = data.template_file.user_data_worker.rendered
  # ip_address     = "172.16.1.125"
  depends_on = [cloudstack_instance.master]
  expunge          = true

}

// test


# Create an RKE Kubernetes cluster on Rancher
resource "rancher2_cluster" "rke_cluster" {
  name        = "rke-cluster6"
  description = "RKE Kubernetes Cluster"
  # rke_version   = "v1.27.8"

  rke_config {
    network {
      plugin = "canal"
    }
  }
}



# Obtain the cluster registration token
resource "rancher2_token" "rke_cluster_token" {
  cluster_id = rancher2_cluster.rke_cluster.id
}


output "rke_cluster_kubeconfig" {
  description = "Kubeconfig for accessing the RKE Cluster"
  value = rancher2_cluster.rke_cluster.kube_config
  sensitive = true
}

# output "rke_cluster_registration_command" {
#   value = rancher2_cluster_registration_token.rke_cluster_token.node_command
# }



