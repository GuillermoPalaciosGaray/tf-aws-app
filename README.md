# tf-aws-app

The template is going to work if you run below commands on your machine, all the required variables have a default value

1. ``` terraform init ```
2. ``` terraform plan ```
3. ``` terraform apply ```

If you want to modify any of the default values please create your custom .tfvars file.

Note: It is important to mention that main.tf is using a local backend, if you wan to follow the best practices 
please create a remote backend e.g AWS S3 and one DynamoDB to support state locking