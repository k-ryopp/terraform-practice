output "ssh_command" {
  value = "ssh -i ~/.ssh/${var.public_key_name} ec2-user@${aws_instance.main.public_ip}"
}
