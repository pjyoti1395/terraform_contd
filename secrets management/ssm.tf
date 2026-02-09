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
  ami           = "ami-0abcd1234abcd1234"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"

  user_data = <<EOF
    #!/bin/bash
    echo "DB_PASSWORD=${data.aws_ssm_parameter.db_password.value}" > /etc/myapp_env
    EOF

  tags = {
    Name = "MyApp-EC2"
  }
}
