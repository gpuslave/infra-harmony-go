include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../modules/bastion_network"
}

inputs = {

  name = {
    network     = "${include.root.inputs.environment}bastion-public-network"
    sg          = "${include.root.inputs.environment}bastion-public-sg"
    subnet      = "${include.root.inputs.environment}bastion-public-subnet"
  }

  sg_description = "allow incoming ssh/22"

  zone                = include.root.inputs.yandex_provider.zone
  subnet_cidr         = include.root.inputs.subnets.external_sub_cidr
}