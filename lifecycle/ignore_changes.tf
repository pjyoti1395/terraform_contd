resource "aws_instance" "ignore_changes" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.micro"
  subnet_id     =  "subnet_1111"
   tags = {
    Name = "ignore-changes-ec2"
    Env  = terraform.workspace
  }

  lifecycle {
    ignore_changes = [
        subnet_id,
        tags
    ]
  }
}
