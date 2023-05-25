locals {
  public_cidr      = cidrsubnet(var.vpc_cidr, 1, 0)
  public_bit_diff  = var.public_subnet_size  - element(split("/", local.public_cidr), 1)
}
