output "id" {
  value = [aws_instance.server_instance.*.id]
}

output "key-name" {
  value = [aws_instance.server_instance.*.key_name]
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.server_instance.*.public_ip
}
