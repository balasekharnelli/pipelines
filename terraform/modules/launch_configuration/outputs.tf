output "launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = concat(aws_launch_configuration.this.*.id, [""])[0]
}
