provider "aws" {
  region = "eu-north-1"
}

# Fetch secret from SSM
data "aws_ssm_parameter" "db_password" {
  name           = "/myapp/db_password"  
  with_decryption = true
}

# Example: Use secret in EC2 user_data
resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"


  user_data = <<EOF
    #!/bin/bash
    echo "DB_PASSWORD=${data.aws_ssm_parameter.db_password.value}" > /etc/myapp_env
    EOF

  tags = {
    Name = "MyApp-EC2"
  }
}
