provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATMFNDBSY6FGL6PFN"
  secret_key = "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"
}

resource "aws_iam_user" "POC-test" {
  name = "azure-devops-deployment-user"
  force_destroy = true
  path          = "/"
  tags = {
    Name = "POC-user"
  }
}

data "aws_iam_policy" "AdministratorAccess" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_policy_attachment" "POC-attach" {
  name       = "AdministratorAccess-policy"
  user_name = "azure-devops-deployment-user"
  # users      = "${data.aws_iam_user.POC-test.arn}"
  policy_arn = "${data.aws_iam_policy.AdministratorAccess.arn}"
}