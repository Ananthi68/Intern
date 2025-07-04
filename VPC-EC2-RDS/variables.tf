variable "private_key_path" {
  default = "C:/Users/Ananthi/.ssh/terraform-key"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform-key"
}

variable "subnet_id" {}
variable "instance_name" {}

variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
