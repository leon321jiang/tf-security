
resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.instance_profile_name
  role = module.role.name
}

module "role" {
  source = "cloudposse/iam-role/aws"

  principals   = var.principals
  //use_fullname = var.use_fullname
  name = var.iam_role_name

  policy_documents = [
    join("", data.aws_iam_policy_document.ec2_full_access.*.json),
    //join("", data.aws_iam_policy_document.base.*.json),
  ]

  policy_document_count = 2
  policy_description    = "Test IAM policy"
  role_description      = "Test IAM role"

  //context = module.this.context
}


data "aws_iam_policy_document" "ec2_full_access"{
    statement {
        sid = "ec2"
        actions = ["ec2:*"]
        effect = "Allow"
        resources = ["*"]
    }
    statement {
        sid = "elb"
        actions = ["elasticloadbalancing:*"]
        effect = "Allow"
        resources = ["*"]
    }
    statement {
        sid = "as"
        actions = ["autoscaling:*"]
        effect = "Allow"
        resources = ["*"]
    }
    statement {
        sid = "cloudwatch"
        actions = ["cloudwatch:*"]
        effect = "Allow"
        resources = ["*"]
    }
    statement {
        sid = "servicelink"
        actions = ["iam:CreateServiceLinkedRole"]
        effect = "Allow"
        resources = ["*"]
    }
}

/* TODO: add conditions for service link policy 

        Condition = {
            "StringEquals": {
                "iam:AWSServiceName": [
                    "autoscaling.amazonaws.com",
                    "ec2scheduled.amazonaws.com",
                    "elasticloadbalancing.amazonaws.com",
                    "spot.amazonaws.com",
                    "spotfleet.amazonaws.com",
                    "transitgateway.amazonaws.com"
                ]
            }
            */