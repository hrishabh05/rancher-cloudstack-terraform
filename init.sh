terraform init \
    -backend-config="address=$project_url/projects/$projectid/terraform/state/demo4" \
    -backend-config="lock_address=http://gitlab-ce.os3.com/api/v4/projects/$project_id/terraform/state/demo4" \
    -backend-config="unlock_address=http://gitlab-ce.os3.com/api/v4/projects/$project_id/terraform/state/demo4" \
    -backend-config="username=$user_name" \
    -backend-config="password=$project_tokan" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"
