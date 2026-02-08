resource "aws_instance" "import_demo" {
  ami           = "ami-02781fbdc79017564"
  instance_type = terraform.workspace == "prod" ? "t3.small" : "t3.micro"

  tags = {
    Name = "import-demo-${terraform.workspace}"
    Env  = terraform.workspace
  }
}
