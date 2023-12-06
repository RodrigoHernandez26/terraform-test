resource "aws_vpc_security_group_egress_rule" "this" {
  count = length(var.egress_rules)

  security_group_id = aws_security_group.this.id

  from_port   = contains(keys(var.egress_rules[count.index]), "from_port") ? var.egress_rules[count.index].from_port : null
  to_port     = contains(keys(var.egress_rules[count.index]), "to_port") ? var.egress_rules[count.index].to_port : null
  ip_protocol = contains(keys(var.egress_rules[count.index]), "protocol") ? var.egress_rules[count.index].protocol : null
  cidr_ipv4   = contains(keys(var.egress_rules[count.index]), "cidr_ipv4") ? var.egress_rules[count.index].cidr_ipv4 : null
}