variable "region" {
  type    = string
  default = "eu-west-2"
}
variable "profile" {
  type    = string
  default = "atos-ams"
}

variable "environment" {
  type = string
}

variable "account_id" {
  description = "external account to operate on"
  type        = string
}

variable "main_vpc" {
  description = "The name of the base deployed VPC in the account"
  type        = string
}

variable "default_tags" {
  type = map(string)
  default = {
    project : "TF101",
    createdBy : "terraform",
    team : "fullstack",
    environment : "sandbox"
  }
}


