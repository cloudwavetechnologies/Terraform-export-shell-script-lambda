terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.18.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "demo_lambda" {
  function_name = var.lambda_function_name
  s3_bucket     = var.bucket
  s3_key        = var.s3_key
  handler       = var.handler
  runtime       = var.runtime
  memory_size   = var.memory_size
  timeout       = var.timeout
  role          = aws_iam_role.lambda_exec.arn
  filename          = var.source_path
  source_code_hash  = filebase64sha256(var.source_path)

  environment {
    variables = {
      ENV_NAME = "dev"
      PROJECT  = "supplychain"
    }
  }

  tags = {
    Environment = "dev"
    Project     = "supplychain"
  }
}