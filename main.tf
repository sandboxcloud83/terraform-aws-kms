data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "default" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}

resource "aws_kms_key" "this" {
  description         = var.key_description
  policy              = var.key_policy_json != null ? var.key_policy_json : data.aws_iam_policy_document.default.json
  deletion_window_in_days = 10
  enable_key_rotation = true
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.this.key_id
}
