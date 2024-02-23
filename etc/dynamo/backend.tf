terraform {
    backend "s3" {
      bucket         = "seaking7-tfstate" # s3 bucket 이름
      key            = "aws_workspace/etc/dynamo/terraform.tfstate" # s3 내에서 저장되는 경로
      region         = "ap-northeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lock"
    }
}