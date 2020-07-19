resource "aws_security_group" "security_group" {
  count  = var.create_security_group ? 1 : 0
  name   = var.security_group_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.security_group_name
  }
}
