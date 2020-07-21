*Steps:*

#1: Update tf code

#2: Run `terraform init`

#3: Run `terrafrm workspace new dev`, similarly run for other envs namely stg & prd

#4: Run `terrafrm workspace show` or `terrafrm workspace list`

`default` is the default workspace

#5: Switch to the required workapce by running `terrafrm workspace select <workspace_name>` and run `terrafrm plan` and check instance_type
