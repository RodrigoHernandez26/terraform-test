output "cluster_identifier" {
  value = aws_docdb_cluster.this.id
}

output "cluster_name" {
  value = aws_docdb_cluster.this.cluster_identifier
}

output "cluster_username" {
  value = aws_docdb_cluster.this.master_username
}