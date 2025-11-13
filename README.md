Full Functional AWS S3 Bucket Using Terraform

This project demonstrates how to create a production-ready Amazon S3 bucket using Terraform.
It includes versioning, lifecycle transitions, expiration rules, multipart cleanup, and follows real-world AWS best practices.

:- Features Implemented

S3 Bucket Creation

Versioning (Enabled)


:- Lifecycle Management

Transition objects to cheaper storage classes:

STANDARD_IA

GLACIER_IR

GLACIER

DEEP_ARCHIVE

:- Delete old object versions

Expire objects after retention period

Clean up incomplete multipart uploads

Terraform IaC Structure 
This project is suitable for DevOps/Cloud interviews to showcase hands-on AWS & Terraform skills.


******************************************************************************
:- How to Deploy

   - Initialize Terraform:

terraform init


    - Validate configuration:

terraform validate


    - Review execution plan:

terraform plan


    - Apply changes:

terraform apply -auto-approve


    - Destroy resources:

terraform destroy -auto-approve
