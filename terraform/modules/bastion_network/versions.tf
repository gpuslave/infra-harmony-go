
terraform {
  required_version = "~>1.11.1"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.136.0"
    }
  }
}