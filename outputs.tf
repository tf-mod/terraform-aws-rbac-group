
output arn {
  value       = aws_iam_group.group.arn
  description = "The ARN of IAM Group"
}

output name {
  value       = aws_iam_group.group.name
  description = "The NAME of IAM Group"
}
