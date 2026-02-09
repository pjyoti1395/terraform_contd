resource "aws_instance" "ignore_changes" {
  ami           = "ami-02781fbdc79017564"
  instance_type = "t3.small"
  subnet_id     =  "subnet-051e2582de50c27d9"
   tags = {
    Name = "Lifecycle_ignore_Changes_EC2"
    Env  = terraform.workspace
  }

  lifecycle {
    ignore_changes = [
        subnet_id,
        tags
    ]
  }
}
