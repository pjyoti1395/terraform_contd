resource "aws_instance" "demo" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "lifecycle-demo"
  }
}
