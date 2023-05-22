### IAM Role and Policy for Codebuild


resource "aws_iam_role" "codebuild_role" {
    name = "codebuild-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
            Service = "codebuild.amazonaws.com"
            }
        },
        ]
    })
}


    resource "aws_iam_role_policy" "codebuild_policy" {
    name = "codebuild_policy"
    role = aws_iam_role.codebuild_role.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action   = ["codecommit:GitPull"]
            Effect   = "Allow"
            Resource = "*"
        },
        {
            Action = [
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:CompleteLayerUpload",
            "ecr:GetAuthorizationToken",
            "ecr:InitiateLayerUpload",
            "ecr:PutImage",
            "ecr:UploadLayerPart"]
            Effect   = "Allow"
            Resource = "*"
        },
        {
            Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"]
            Effect   = "Allow"
            Resource = "*"
        },
        {
            Action = [
            "s3:PutObject",
            "s3:GetObject",
            "s3:GetObjectVersion",
            "s3:GetBucketAcl",
            "s3:GetBucketLocation"]
            Effect   = "Allow"
            Resource = "*"
        }]
    })
}


### IAM Role and Policy for Codepipeline

resource "aws_iam_role" "codepipeline_role" {
    name = "codepipeline_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
            Service = "codepipeline.amazonaws.com"
            }
        },
        ]
    })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
    name = "codepipeline_policy"
    role = aws_iam_role.codepipeline_role.id
    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
            Action = [
            "codepipeline:CreatePipeline",
            "codepipeline:StartPipelineExecution",
            "codepipeline:StopPipelineExecution",
            "codepipeline:GetPipelineState",
            "codepipeline:GetPipeline",
            "codepipeline:GetPipelineExecution",
            "codepipeline:GetPipelineVersion",
            "codepipeline:ListPipelineExecutions",
            "codepipeline:ListPipelines",
            "codepipeline:ListPipelineVersions",
            "codepipeline:ListWebhooks",
            "codedeploy:CreateDeployment",
            "codedeploy:GetApplicationRevision",
            "codedeploy:GetDeployment",
            "codedeploy:GetDeploymentConfig",
            "codedeploy:RegisterApplicationRevision",
            "codebuild:BatchGetBuilds",
            "codebuild:StartBuild",
            "codestar-connections:UseConnection",
            "codestar-connections:CreateConnection",
            "s3:*",
            "ecs:*",
            "ecr:*",
            "iam:PassRole"]
            Effect = "Allow"
            Resource = "*"
            }
        ]
    }) 
}
