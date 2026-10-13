output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "elastic_ip" {
  description = "Elastic IP"
  value       = aws_eip.web.public_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.web.id
}

output "iam_role_name" {
  description = "IAM Role name"
  value       = aws_iam_role.ec2_role.name
}