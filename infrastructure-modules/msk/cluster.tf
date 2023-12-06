resource "aws_kms_key" "kafka_kms_key" {
  description = "Key for Apache Kafka ${var.env}-${var.name}"
}

resource "aws_cloudwatch_log_group" "kafka_log_group" {
  count = var.cloudwatch_log ? 1 : 0
  name  = "${var.env}-${var.name}_kafka_broker_logs"
}

resource "aws_msk_configuration" "kafka_config" {
  kafka_versions    = [var.cluster_version]
  name              = "${var.env}-${var.name}-config"
  server_properties = <<EOF
auto.create.topics.enable = true
delete.topic.enable = true
EOF
}

resource "aws_msk_cluster" "kafka" {
  cluster_name           = "${var.env}-${var.name}"
  kafka_version          = var.cluster_version
  number_of_broker_nodes = length(var.subnet_ids)

  broker_node_group_info {
    instance_type = var.instance_class

    storage_info {
      ebs_storage_info {
        volume_size = var.storage_per_broker
      }
    }

    client_subnets  = var.subnet_ids
    security_groups = var.security_group_ids
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "PLAINTEXT"
    }
    encryption_at_rest_kms_key_arn = aws_kms_key.kafka_kms_key.arn
  }

  configuration_info {
    arn      = aws_msk_configuration.kafka_config.arn
    revision = aws_msk_configuration.kafka_config.latest_revision
  }

  dynamic "logging_info" {
    for_each = var.cloudwatch_log ? ["this"] : []

    content {
      broker_logs {
        cloudwatch_logs {
          enabled   = true
          log_group = aws_cloudwatch_log_group.kafka_log_group.name
        }
      }
    }
  }
}
