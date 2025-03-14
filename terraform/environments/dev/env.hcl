locals {
  environment = "dev"

  ip_addr = {
    bastion_ext_ip = "51.250.35.119"
    bastion_int_ip = "172.16.16.254"
  }

  subnets = {
    external_sub_cidr = "172.16.17.0/28"
    internal_sub_cidr = "172.16.16.0/24"
  }

  # Images configuration
  images = {
    ubuntu_2404         = "fd8m5hqeuhbtbhltuab4"
    ubuntu_2204_bastion = "fd81vhfcdt7ntmco1qeq"
  }

  ssh_keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCOMEPyVRcix6K9ZcJcQ+Lr5ScVG9/o7bLurlOXt2S4jZuXSgrVwmuor6gjNEJy7hLePMH7i6ObBIYmQdXhPvwvqVgRKoycqmYy7IXvHPNpIwGbDKwiDVrWhgif8P8i3ywDDY27FHBYvzRtT54BcFPaBaUG9iX7qK5Rk0zr4veH63WTRGRjHn972SMfA+pg2ArEyAsKvJ+A9oSuXClayqiCA8sCWHKcyg8kqRfEFWsvzN/MQLk6LZspZYCqJ9s+cwsBmYboLIOd2BiNWBpL/I1TLdBOmcO2f6AqrroYBhJxV7xpHCJh7UnQU/F+85GU/ztL8fQoeuYnu4mfIOfIAHt gpuslave@batman.local",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFAJXHVAiJNyuDyr5qwBAqyoYhSUb6HZw6Ka/fZaK1ax gpuslave@gpuslave-win"
  ]
}