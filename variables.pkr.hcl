variable "region" {
  type    = string
  default = ""
}

variable "source_ami" {
  type    = string
  default = "ami-0ea3c35c5c3284d82"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "aws_profile" {
  type    = string
  default = "user1"
}

# variable "aws_access_key" {
#   type    = string
#   default = "abc"
# }

# variable "aws_secret_access_key" {
#   type    = string
#   default = "xyz"
# }