output "instance1_ip" {
  description = "Instance IP address"
  value       = aws_instance.demo_instance_1.private_ip
}
output "instance1_ip_public" {
  description = "Instance IP address"
  value       = aws_instance.demo_instance_1.public_ip
}
