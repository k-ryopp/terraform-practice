variable "common_resource_name" {
  type    = string
  default = "terraform-handson"
}

variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "public_key_name" {
  type    = string
  default = "terraform-handson-keypair"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/terraform-handson-keypair.pub"
}
