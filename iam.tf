resource "aws_iam_user" "duke" {
  name = "duke"
}

resource "aws_iam_group" "devops_group" {
  name = "devops"
}