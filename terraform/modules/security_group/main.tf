resource "aws_security_group" "security_group" {
  count  = var.create_security_group ? 1 : 0
  name   = var.security_group_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_security_group_rule" "outbound-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = concat(aws_security_group.security_group.*.id, [""])[0]
  cidr_blocks       = ["0.0.0.0/0"]
}
