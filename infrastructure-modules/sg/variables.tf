variable "env" {
  type = string
}

variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_rules" {
  type = map(any)
}

variable "egress_rules" {
  type = map(any)
  default = [{
    protocol  = "-1"
    cidr_ipv4 = ["0.0.0.0/0"]
    cidr_ipv6 = ["::/0"]
  }]
}
