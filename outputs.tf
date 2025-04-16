output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.ec2_lab.public_ip
}

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.ec2_lab.id
}