data "template_file" "user_data_master" {
  template = file("./configs/master-cloud-init.yaml")
  vars = {
    register_cmd = "${rancher2_cluster.rke_cluster.cluster_registration_token.0.node_command} --etcd --controlplane"
  }
}

data "template_file" "user_data_worker" {
  template = file("./configs/worker-cloud-init.yaml")
  vars = {
    register_cmd = "${rancher2_cluster.rke_cluster.cluster_registration_token.0.node_command} --worker"
  }
}




# data "template_file" "cloud-config-master" {
#   template = file("./configs/master-cloud-init.yaml")
#   vars = {
#     ssh_public_key = harvester_ssh_key.mysshkey.public_key
#     register_cmd   = "${rancher2_cluster.deploy.cluster_registration_token.0.node_command} --etcd --controlplane"
#   }
# }
