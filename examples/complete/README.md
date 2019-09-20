# Full example of IAM group for RBAC (Role-Based Access Control)

## Usage
### Create an IAM group to centralized ID account

You can use this module like as below example.

```
module "infra-engineer-group" {
  source  = "tf-mod/rbac-group/aws"
  version = "1.0.0"

  name             = var.name
  stack            = var.stack
  desc             = var.desc
  policy_arn       = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}
```
