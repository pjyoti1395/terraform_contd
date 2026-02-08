resource "aws_instance" "import_demo" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.micro"
}
