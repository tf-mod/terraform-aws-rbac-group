
# iam group module
resource "aws_iam_group" "group" {
  name = local.name
  path = "/"
}

# security/policy
data "aws_iam_policy_document" "assume" {
  count = length(var.target_role_arn) > 0 ? 1 : 0
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
  count  = length(var.target_role_arn) > 0 ? 1 : 0
  name   = join("-", [local.name, "assume"])
  policy = data.aws_iam_policy_document.assume[0].json
}

resource "aws_iam_group_policy_attachment" "assume" {
  count      = length(var.target_role_arn) > 0 ? 1 : 0
  policy_arn = aws_iam_policy.assume[0].arn
  group      = aws_iam_group.group.name
}

resource "aws_iam_group_policy_attachment" "policy" {
  count      = length(var.policy_arn)
  policy_arn = element(var.policy_arn, count.index)
  group      = aws_iam_group.group.name
}
