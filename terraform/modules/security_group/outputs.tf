output "security_group_id" {
  value = concat(aws_security_group.security_group.*.id, [""])[0]
}
