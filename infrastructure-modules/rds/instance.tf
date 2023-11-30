resource "aws_db_instance" "this" {
  allocated_storage = var.allocated_storage
    engine            = var.engine
    instance_class    = var.instance_class
    username          = var.username
    password          = var.password
    skip_final_snapshot = var.skip_final_snapshot

    tags = merge({ Name = "${var.env}-${var.name}-rds" },
      var.tags
    )

    monitoring_interval = var.monitoring_interval
    monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn

    vpc_security_group_ids = var.security_group_ids
    db_subnet_group_name = aws_db_subnet_group.subnet_group.name

    multi_az = var.multi-az

    depends_on = [ aws_iam_policy_attachment.rds_monitoring_attachment ]
}