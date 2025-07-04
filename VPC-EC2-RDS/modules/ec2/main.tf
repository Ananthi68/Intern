resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  provisioner "file" {
    source      = "${path.module}/mysql-connection.php"
    destination = "/tmp/mysql-connection.php"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/mysql-connection.php /var/www/html/",
      "sudo chown apache:apache /var/www/html/mysql-connection.php"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  tags = {
    Name = var.instance_name
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
