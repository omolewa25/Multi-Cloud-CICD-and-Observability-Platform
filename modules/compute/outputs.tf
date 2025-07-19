
output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "ec2_ids" {
  value = aws_autoscaling_group.asg.instances[*].id
}
