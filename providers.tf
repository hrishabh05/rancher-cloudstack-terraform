terraform {
  # required_version = ">= 0.13"
  required_providers {
    cloudstack = {
      source  = "registry.terraform.io/cloudstack/cloudstack"
      version = "0.4.0"
    }
 
  
    rancher2 = {
      source = "rancher/rancher2"
      version = "~> 2.0.0"
    }
  }  
}


