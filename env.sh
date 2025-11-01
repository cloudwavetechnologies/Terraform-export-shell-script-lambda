#!/bin/bash

export TF_VAR_lambda_function_name="cloudwave-dev-lambda-001"
unset TF_VAR_region
export TF_VAR_runtime="python3.9"
export TF_VAR_handler="lambda_function.lambda_handler"
#export TF_VAR_role_arn="arn:aws:iam::093326771949:role/service-role/amazon-java-code-lambda-001-role-0w2vgpaj"
export TF_VAR_bucket="supplychain-s3-000"
export TF_VAR_s3_key="lambda/lambda_function.zip"
export TF_VAR_memory_size=256
export TF_VAR_timeout=60
export TF_VAR_source_path="lambda_function.zip"
export TF_VAR_role_arn=arn:aws:iam::093326771949:role/service-role/amazon-java-code-lambda-001-role-0w2vgpaj
export TF_VAR_tags='{
  Environment = "prod",
  Owner       = "manjunath",
  Project     = "cloud-training"
}'

echo "Terraform environment variables exported!"