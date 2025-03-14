
resource "yandex_compute_disk" "this" {
  name = var.boot_disk.name
  zone = var.boot_disk.zone

  type     = var.boot_disk.type
  size     = var.boot_disk.size
  image_id = var.boot_disk.image_id
}

resource "yandex_compute_instance" "this" {
  name = var.bastion.name
  zone = var.bastion.zone

  platform_id = var.bastion.platform_id

  resources {
    cores  = var.bastion.resources.cores
    memory = var.bastion.resources.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.this.id
  }

  network_interface {
    subnet_id          = var.public_network.subnet_id
    nat                = true
    nat_ip_address     = var.public_network.bastion_public_ip
    security_group_ids = [var.public_network.sg_id]
  }

  network_interface {
    subnet_id          = var.private_network.subnet_id
    ipv4               = true
    ip_address         = var.private_network.bastion_private_ip
    security_group_ids = [var.private_network.sg_id]
  }

  metadata = {
    "user-data" = templatefile("${path.module}/config/user-data.yaml.tftpl", {
      "user_name" = var.user
      "ssh_keys"  = var.ssh_keys
    })
  }
}