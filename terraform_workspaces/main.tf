
data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}


resource "aws_instance" "myec2" {
  ami           = data.aws_ami.ec2_ami.id
  instance_type = lookup(var.instance_type, terraform.workspace)
}
