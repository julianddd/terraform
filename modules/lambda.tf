data "aws_iam_policy_document" "lambda_assume_role_policy"{
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_role" {  
  name = "lambda-lambdaRole-waf"  
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "${path.module}/code/lambda_function.py" 
  output_path = "nametest.zip"
}

resource "aws_lambda_function" "test_lambda_function" {
        function_name = "lambdaTest"
        filename      = "nametest.zip"
        source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
        role          = aws_iam_role.lambda_role.arn
        runtime       = "python3.10"
        handler       = "lambda_function.lambda_handler"
        timeout       = 10
}