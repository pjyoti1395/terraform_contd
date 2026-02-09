resource "aws_instance" "safe_ec2" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.small"

  tags = {
    Name = "prod-ec2"
  }

  lifecycle {
    prevent_destroy = true
  }
}
