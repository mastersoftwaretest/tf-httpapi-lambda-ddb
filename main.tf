data "aws_caller_identity" "current" {}

locals {
  name_prefix = "jiaqing9"
  # split("/", "${data.aws_caller_identity.current.arn}")[1]
}
