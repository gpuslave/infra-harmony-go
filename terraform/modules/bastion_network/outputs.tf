output "network_id" {
  value = yandex_vpc_network.this.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.public.id
}

output "sg_id" {
  value = yandex_vpc_security_group.custom_sg.id
}