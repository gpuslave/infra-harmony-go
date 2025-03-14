locals {
  environment = "dev"

  ip_addr = {
    bastion_ext_ip = "51.250.35.119"
    bastion_int_ip = "172.16.16.254"
  }

  subnets = {
    external_sub_cidr = "172.16.17.0/28"
    internal_sub_cidr = "172.16.16.0/24"
  }
}