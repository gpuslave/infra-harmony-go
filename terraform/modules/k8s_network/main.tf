
resource "yandex_vpc_network" "this" {
  name = var.name.network
}

resource "yandex_vpc_security_group" "custom_sg" {
  name        = var.name.sg
  description = var.sg_description
  network_id  = yandex_vpc_network.this.id

  # TCP/22
  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["${var.bastion_internal_ip}/32"]
  }

  egress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["${var.bastion_internal_ip}/32"]
  }

  # ICMP
  ingress {
    protocol       = "ICMP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ICMP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP/HTTPS
  egress {
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_gateway" "egress_gateway" {
  name = var.name.gateway

  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "private" {
  name       = var.name.route_table
  network_id = yandex_vpc_network.this.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.egress_gateway.id
  }
}

resource "yandex_vpc_subnet" "private" {
  name = var.name.subnet
  zone = var.zone

  network_id = yandex_vpc_network.this.id

  route_table_id = yandex_vpc_route_table.private.id

  v4_cidr_blocks = [var.subnet_cidr]
}

