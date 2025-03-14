
variable "name" {
  type = object({
    network     = string
    sg          = string
    subnet      = string
    gateway     = string
    route_table = string
  })
  description = "object names"
}

variable "sg_description" {
  type = string
}

variable "bastion_internal_ip" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet_cidr" {
  type = string
}