resource "aws_launch_template" "mylt" {
  name = "MyTF-App-LT"

  image_id      = "ami-048f644e868baa0e8"
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.app-sg.id 
  ]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Terraform 3-Tier Application</h1>" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Terraform-App-Server"
    }
  }
}