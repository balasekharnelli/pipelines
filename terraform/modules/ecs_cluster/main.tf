resource "aws_ecs_cluster" "ecs_cluster" {
  count = var.create_ecs_cluster ? 1 : 0

  name = var.ecs_cluster_name

  tags = merge(
    {
      Name = var.ecs_cluster_name
    },
    var.tags
  )
}
