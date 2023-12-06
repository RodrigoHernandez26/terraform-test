module "sg_kafka" {
  source = "../../infrastructure-modules/sg"

  env    = var.env
  name   = "sg-kafka"
  vpc_id = var.vpc_id

  ingress_rules = {
    from_port = 0
    to_port   = 9092
    protocol  = "TCP"
  }
}