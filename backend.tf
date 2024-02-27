terraform {
  backend "http" {
    address="$/api/v4/projects/16/terraform/state/demo4"
    lock_address="/api/v4/projects/16/terraform/state/demo4"
    unlock_address="/api/v4/projects/16/terraform/state/demo4"
    username=""
    password=""
    lock_method="POST"
    unlock_method="DELETE"
    retry_wait_min="5"

    
  }
}





# same as init.sh 
