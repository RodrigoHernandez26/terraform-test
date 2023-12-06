resource "aws_vpc_security_group_egress_rule" "this" {
  count = length(var.egress_rules)

  security_group_id = aws_security_group.this.id

  from_port   = var.egress_rules[count.index].from_port
  to_port     = var.egress_rules[count.index].to_port
  ip_protocol = var.egress_rules[count.index].ip_protocol
  cidr_ipv4   = var.egress_rules[count.index].cidr_ipv4
}