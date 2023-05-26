# Usage
## Requirements

You should have installed terraform on your device

## Providers
|Name|Version|
|----|-------|
|<a name="provider_aws"></a> [aws](#provider\_aws)| gt 4.22|

## Modules
|Name|Source|Version|
|----|------|-------|
|tf-aws-app|git::https://github.com/GuillermoPalaciosGaray/tf-aws-wordpress-ec2-rds.git|version-01|

## Resources
|Name|Type|
|----|----|
|[aws_availability_zones.available_az](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)|data source|
|[aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)|data source|
|[aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)|data source|
|[aws_iam_policy_document.policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)|data source|
|[aws_iam_policy_document.s3_bucket_lb_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)|data source|
|[aws_elb_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account.html)|data source|
|[aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)|data source|

## Inputs
|Name|Description|Type|Default|
|----|-----------|---|-------|
|region|AWS Region where the resources are going to be deployed|string|us-east-1|
|tags|Tags to propogate to all supported resources|map(string)|"terraform_managed" = "true"|
|vpc_name|Name of the VPC to create|string|Primary VPCZ|
|vpc_cidr|CIDR associated with the VPC to be created|string|10.1.0.0/16|
|enable_dns_hostnames|Should be true to enable DNS hostnames in the VPC|bool|true|
|enable_dns_support|Should be true to enable DNS support in the VPC|bool|true|
|public_subnet_size|The size of the Public subnet.|number|24|
|az_count|The number of AZs to deploy infrastructure to|number|2|
|alb_sg_name|Name of the ALB Security Group|string|alb_security_group|
|ec2_sg_name|Name of the Public Security Group for EC2|string|public_ec2_sg|
|lb_name|Name of load balancer|string|ext-alb|
|load_balancer_type|Indicate the type of load balancer.|string|application|
|is_internal_lb|Indicate wheter load balancer is internal.|bool|false|
|is_enabled_cross_zn_lb|Indicate wheter cross zone load balancing is enabled.|bool|true|
|lb_target_group_name|Load balancer target group name.|string|tg-ext-alb-asg|
|is_access_logs_enabled|Indicate wheter load balancer access logs are enabled.|bool||
|aws_key_pair_name|AWS EC2 Key pair needed to be associated with EC2.|string|terraform-managed-key|
|launch_template_name|The name for launch template.|string|web-lc|
|instance_type|The instance type for EC2 instances.|string|t2.micro"|
|device_name|Storage device name.|string|/dev/xvda|
|volume_size|Size of root EBS volume of the container instance.|number|8|
|volume_type|Volume type of the container instance.|string|gp2|
|is_delete_on_termination|Indicate whether the volume should be destroyed on instance termination.|bool|true|
|is_volume_encrypted|Indicate whether the EBS encryption is enabeld on the volume.|bool|true|
|associate_public_ip_address|Indicate wheter associate_public_ip_address|bool|true|
|autoscaling_group_name|The name for the autoscaling group for the web|string|web-asg|
|max_instance_size|The max instances number for the webserver|number|4|
|min_instance_size|The min instance number for the webserver|number|2|
|health_check_type|Auto Scaling Group health Check Type|string|EC2|
|cw_alarm_name|Cloud Watch Alarm Name|string|cloudwatch_alarm|
|s3_bucket_name|S3 bucket Name|string||lb-access-logs-s3|
|acl|S3 bucket ACL type|string|private|
|expiration_days|S3 expiration time for all objects|number|30|
|force_destroy|Indicate wheter force to destroy the S3 bucket|bool|true|