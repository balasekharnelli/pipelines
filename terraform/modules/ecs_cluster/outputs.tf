output "ecs_cluster_id" {
  description = "The ID that identifies the cluster"
  value       = concat(aws_ecs_cluster.ecs_cluster.*.id, [""])[0]
}

output "ecs_cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value       = concat(aws_ecs_cluster.ecs_cluster.*.arn, [""])[0]
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = concat(aws_ecs_cluster.ecs_cluster.*.name, [""])[0]
}
