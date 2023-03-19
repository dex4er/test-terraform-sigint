terraform {
  required_version = ">= 1.4.0"

  required_providers {
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

variable "duration" {
  type    = string
  default = "1m"
}

resource "time_sleep" "duration" {
  create_duration  = var.duration
  destroy_duration = var.duration
}

resource "time_static" "static" {}

resource "time_sleep" "duration2" {
  create_duration  = var.duration
  destroy_duration = var.duration
  depends_on = [
    time_static.static
  ]
}
