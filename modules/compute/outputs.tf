output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.asg.name
}

output "bastion_id" {
  value = aws_instance.bastion.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}