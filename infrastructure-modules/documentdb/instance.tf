resource "aws_docdb_cluster_instance" "cluster" {
  count              = var.instance_count
  identifier         = "${var.cluster_name}-${count.index}"
  cluster_identifier = aws_docdb_cluster.this.id
  instance_class     = var.instance_class
}