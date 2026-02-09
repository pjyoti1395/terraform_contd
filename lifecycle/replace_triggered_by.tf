resource "aws_instance" "replace_triggered_demo" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0efdd9adaedbf45eb"  
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  lifecycle {
    replace_triggered_by = [
      aws_security_group.my_sg
    ]
  }

  tags = {
    Name = "replace-trigger-demo"
  }
}
