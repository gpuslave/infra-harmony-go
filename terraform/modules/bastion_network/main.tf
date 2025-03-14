
resource "yandex_vpc_network" "this" {
  name = var.name.network
}

resource "yandex_vpc_security_group" "custom_sg" {
  name        = var.name.sg
  description = var.sg_description
  network_id  = yandex_vpc_network.this.id

  # incoming TCP/22
  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  # outgoing HTTP/HTTPS
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

resource "yandex_vpc_subnet" "public" {
  name = var.name.subnet
  zone = var.zone

  network_id = yandex_vpc_network.this.id

  v4_cidr_blocks = [var.subnet_cidr]
}

