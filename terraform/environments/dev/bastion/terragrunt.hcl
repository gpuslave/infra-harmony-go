include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../modules/bastion"
}

dependency "public_network" {
  config_path = "../bastion_network"

  mock_outputs = {
    network_id = "some-public-network-id"
    subnet_id  = "some-public-subnet-id"
    sg_id      = "some-public-sg-id"
  }
}

dependency "private_network" {
  config_path = "../k8s_network"

  mock_outputs = {
    network_id = "some-private-network-id"
    subnet_id  = "some-private-subnet-id"
    sg_id      = "some-private-sg-id"
  }
}

inputs = {
  boot_disk = {
    image_id = include.root.inputs.images.ubuntu_2204_bastion
    name     = "${include.root.inputs.environment}-bastion-boot"
    zone     = include.root.inputs.yandex_provider.zone
    size     = 64
    type     = "network-hdd"
  }

  bastion = {
    name        = "${include.root.inputs.environment}-bastion-k8s"
    zone        = include.root.inputs.yandex_provider.zone
    platform_id = "standard-v2"
    resources = {
      cores  = 2
      memory = 2
    }
  }

  public_network = {
    subnet_id         = dependency.public_network.outputs.subnet_id
    bastion_public_ip = include.root.inputs.ip_addr.bastion_ext_ip
    sg_id             = dependency.public_network.outputs.sg_id
  }

  private_network = {
    subnet_id         = dependency.private_network.outputs.subnet_id
    bastion_private_ip = include.root.inputs.ip_addr.bastion_int_ip
    sg_id             = dependency.private_network.outputs.sg_id
  }

  user     = "ubuntu"
  ssh_keys = include.root.inputs.ssh_keys
}