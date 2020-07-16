data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.sh")}"

  vars {
    ecs_cluster = "${aws_ecs_cluster.this.name}"
  }
}

#Cluster
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  tags = {
    Name = var.cluster_name
  }
}

#Launch Configuration
resource "aws_launch_configuration" "this" {
  name                 = var.launch_configuration_name
  image_id             = var.image_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  user_data            = "${data.template_file.user_data.rendered}"
  security_groups      = var.security_groups
  key_name             = var.key_name

  root_block_device {
    volume_size = var.instance_root_volume_size
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#Autoscaling
resource "" "" {

}
