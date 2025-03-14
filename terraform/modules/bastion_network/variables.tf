
variable "name" {
  type = object({
    network     = string
    sg          = string
    subnet      = string
  })
  description = "object names"
}

variable "sg_description" {
  type = string
}

variable "zone" {
  type = string
}

variable "subnet_cidr" {
  type = string
}