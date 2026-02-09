resource "aws_instance" "demo" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.my_subnet.id

  lifecycle {
    ignore_changes = [subnet_id]
  }
}
