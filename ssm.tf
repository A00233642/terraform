resource "aws_iam_role" "ssm_role" {
  name = "ssm_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    owner = "pragra-test"
  }


}


data "aws_iam_policy" "pragra_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


resource "aws_iam_role_policy_attachment" "ooc" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = data.aws_iam_policy.pragra_policy.arn

}

resource "aws_iam_instance_profile" "test_profile" {

  name = "test_profile"
  role = aws_iam_role.ssm_role.name

}

