include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../modules/k8s"
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
  network_id = dependency.private_network.outputs.network_id 
  cluster_name = "${include.root.inputs.environment}-k8s-harmony-cluster"
  cluster_version = "1.31"

  use_existing_sa = true

  master_service_account_id = include.root.inputs.k8s_service_account_id
  node_service_account_id = include.root.inputs.k8s_service_account_id

  security_groups_ids_list = [ dependency.private_network.outputs.sg_id ]

  master_locations = [
    {
      zone = include.root.inputs.yandex_provider.zone
      subnet_id = dependency.private_network.outputs.subnet_id
    }
  ]

  node_groups = {
    "default-group" = {
      fixed_scale = {
        size = 1
      }
    }
  }
}