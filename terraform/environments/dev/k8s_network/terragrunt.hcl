include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../modules/k8s_network"
}

inputs = {

  name = {
    network     = "${include.root.inputs.environment}-k8s-private-network"
    sg          = "${include.root.inputs.environment}-k8s-private-sg"
    subnet      = "${include.root.inputs.environment}-k8s-private-subnet"
    gateway     = "${include.root.inputs.environment}-k8s-private-gateway"
    route_table = "${include.root.inputs.environment}-k8s-private-route-table"
  }

  sg_description = "custom security group"

  zone                = include.root.inputs.yandex_provider.zone
  bastion_internal_ip = include.root.inputs.ip_addr.bastion_int_ip
  subnet_cidr         = include.root.inputs.subnets.internal_sub_cidr
}