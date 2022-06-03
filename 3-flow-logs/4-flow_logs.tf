resource "aws_flow_log" "example" {
  iam_role_arn             = aws_iam_role.cloudwatch_flow_logs.arn
  log_destination          = aws_cloudwatch_log_group.subnet_logs.arn
  traffic_type             = "ALL"
  vpc_id                   = aws_vpc.vpc.id
  max_aggregation_interval = 60

  tags = {
    Name = "MyFlowLogs"
  }
}

resource "aws_cloudwatch_log_group" "subnet_logs" {
  name              = "vpc-flow-logs"
  retention_in_days = 5
}

resource "aws_iam_role" "cloudwatch_flow_logs" {
  name = "cloudwatch_flow_logs_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "flow_log_policy" {
  name = "flow_log_policy"
  role = aws_iam_role.cloudwatch_flow_logs.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
