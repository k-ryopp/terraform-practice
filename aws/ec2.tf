data "aws_ami" "amznlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = var.public_key_name
  public_key = file("${var.public_key_path}")
}

resource "aws_instance" "main" {
  ami                         = data.aws_ami.amznlinux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ssh.id]
  key_name                    = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "${var.common_resource_name}-server"
  }
}
