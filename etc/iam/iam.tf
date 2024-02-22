provider "aws" {
  region  = "ap-northeast-2"
}

resource "aws_iam_user" "duke" {
  name = "duke"
}


resource "aws_iam_user_policy" "terraform-user-policy" {
  name  = "super-admin"
  user  = aws_iam_user.duke.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_group" "devops_group" {
  name = "devops"
}

# user duke 를 devops 그룹에 할당
resource "aws_iam_group_membership" "devops" {
  name = aws_iam_group.devops_group.name

  users = ["duke"]
  

  group = aws_iam_group.devops_group.name
}


resource "aws_iam_role" "terraform-role" {
  name               = "terraform-iam-role"
  path               = "/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "terraform_s3_role" {
  name   = "terraform-s3-download"
  role   = aws_iam_role.terraform-role.id
  policy = <<EOF
{
  "Statement": [
    {
      "Sid": "AllowAppArtifactsReadAccess",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow"
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "terraform-profile" {
  name = "terraform-profile"
  role = aws_iam_role.terraform-role.name
}

