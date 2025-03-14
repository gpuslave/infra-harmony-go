
module "kube" {
  source = "github.com/terraform-yc-modules/terraform-yc-kubernetes?ref=1.1.1"

  network_id      = var.network_id
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  master_service_account_id = var.master_service_account_id
  node_service_account_id = var.node_service_account_id

  security_groups_ids_list = var.security_groups_ids_list

  public_access = var.public_access
  # Network
  enable_cilium_policy    = var.enable_cilium_policy

  # Master parameters
  master_auto_upgrade        = var.master_auto_upgrade
  master_labels              = var.master_labels
  master_locations           = var.master_locations
  master_logging             = var.master_logging

  # Node groups parameters
  node_groups = var.node_groups
}