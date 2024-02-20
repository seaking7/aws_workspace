# This variable defines the AWS Region.
variable "region" {
  description = "region to use for AWS resources"
  type        = string
  default     = "ap-northeast-2"
}

variable "global_prefix" {
  type    = string
  default = "ssp-msk"
}

# variable "private_cidr_blocks" {
#   type = list(string)
#   default = [
#     "10.0.1.0/24",
#     "10.0.2.0/24",
#     "10.0.3.0/24",
#   ]
# }

# variable "cidr_blocks_bastion_host" {
#   type = list(string)
#   default = ["10.0.4.0/24"]
# }



locals {
  name = "ssp-test2"
  vpc = "vpc-03e87995936924eb2"
  subnet_ids      = ["subnet-065400bba8c35c98b","subnet-05e1bf16b38805205"]
  broker_node_security_groups = ["sg-0d98cab2e93226e7e"]
}
