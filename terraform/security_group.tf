resource "aws_security_group" "this" {
  name   = var.security_group_name
  vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group_rule" "Assignment_ecs_egress-out-1" {
  security_group_id = aws_security_group.this.id
  description       = "ECS In"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "Assignment_ecs_ingress-in-1" {
  security_group_id = aws_security_group.this.id
  description       = "ECS Out"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
