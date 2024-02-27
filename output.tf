# output "ssh_keypair_name" {
#   value = cloudstack_ssh_keypair.my_key.name
#   description = "The name of the SSH key pair."
# }

# output "ssh_keypair_fingerprint" {
#   value = cloudstack_ssh_keypair.my_key.fingerprint
#   description = "The fingerprint of the SSH key pair."
# }

output "ip" {
    value = cloudstack_instance.master.ip_address
}

