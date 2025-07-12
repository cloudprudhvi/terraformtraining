resource "aws_instance" "example" {
  ami           = "ami-0bbe33b61c1e14975"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  key_name = "junebatchwest"

  provisioner "local-exec" {
    command = "echo Instance ${self.id} has been created!"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${path.module}/junebatch.pem")
      host        = self.public_ip
    }
  }
 provisioner "file" {
    source      = "sample.txt"
    destination = "/tmp/sample.txt"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./junebatch.pem")
      host        = self.public_ip
    }
  }
}
