variable "aws_region" {
    type = string
}

variable "iam_user_list" {
    type = list(string)
}


variable "image_id" {
  type = string
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["ap-northeast-2a"]
}

variable "ami_id_maps" {
  type = map
  default = {}
}