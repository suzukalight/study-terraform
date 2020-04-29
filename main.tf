provider "aws" {
  region = "ap-northeast-1"
}

variable "example_instance_type" {
  default = "t3.micro"
}

module "web_server" {
  source        = "./http_server"
  instance_type = var.example_instance_type

}

output "public_dns" {
  value = module.web_server.public_dns
}
