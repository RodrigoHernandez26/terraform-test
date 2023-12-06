module "msk" {
  source = "../../infrastructure-modules/msk"

    env    = var.env
    name   = "msk-test"
    subnet_ids = var.private_subnet_ids
    security_group_ids = var.security_group_ids
}