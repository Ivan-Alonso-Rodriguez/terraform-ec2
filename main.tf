resource "aws_security_group" "ssh_http" {
  name        = "allow_ssh_http"
  description = "Permite SSH y HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_lab" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh_http.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  # Este parte instala nginx y escribe "Hola desde Terraform" en la web
  user_data = <<-EOF
                #!/bin/bash
                apt update -y
                apt install -y nginx
                echo "<h1>Hola desde Terraform</h1>" > /var/www/html/index.html
                systemctl start nginx
                systemctl enable nginx
              EOF

  tags = {
    Name = "TerraformEC2"
  }
}
