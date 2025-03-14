variable "boot_disk" {
  type = object({
    name     = string
    zone     = string
    size     = number
    image_id = string
    type     = string
  })
}

variable "bastion" {
  type = object({
    name        = string
    zone        = string
    platform_id = string
    resources = object({
      cores  = number
      memory = number
    })
  })
}

variable "private_network" {
  type = object({
    subnet_id          = string
    bastion_private_ip = string
    sg_id              = string
  })
}

variable "public_network" {
  type = object({
    subnet_id         = string
    bastion_public_ip = string
    sg_id             = string
  })
}

variable "user" {
  type        = string
  description = "linux machine username"
}

variable "ssh_keys" {
  type        = list(string)
  description = "ssh public keys for users"
}