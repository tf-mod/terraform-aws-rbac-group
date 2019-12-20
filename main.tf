
# iam group module
resource "aws_iam_group" "group" {
  name = local.name
  path = "/"
}

# security/policy
data "aws_iam_policy_document" "assume" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect    = "Allow"
    resources = var.target_role_arn
  }
}

# security/policy
resource "aws_iam_policy" "assume" {
  name   = join("-", [local.name, "assume"])
  policy = data.aws_iam_policy_document.assume.json
}

resource "aws_iam_group_policy_attachment" "assume" {
  policy_arn = aws_iam_policy.assume.arn
  group      = aws_iam_group.group.name
}

resource "aws_iam_group_policy_attachment" "policy" {
  count      = length(var.policy_arn)
  policy_arn = element(var.policy_arn, count.index)
  group      = aws_iam_group.group.name
}
