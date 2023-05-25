resource "aws_iam_role" "instance_role" {
  name               = "iam_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "assume_role" {
  name   = "iam_iam_role_policy"
  role   = aws_iam_role.instance_role.id
  policy = data.aws_iam_policy_document.policy_document.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "iam_instance_profile"
  role = aws_iam_role.instance_role.name
}
