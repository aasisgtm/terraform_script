resource "aws_codebuild_project" "express_app" {
    name          = "express_app"
    description   = "Builds an express application"
    service_role  = aws_iam_role.codebuild_role.arn
    build_timeout = "5"
    artifacts {
        type = "CODEPIPELINE"
    }
    environment {
        compute_type    = "BUILD_GENERAL1_SMALL"
        image           = "aws/codebuild/standard:4.0"
        type            = "LINUX_CONTAINER"
        privileged_mode = true
    }
    source {
        type      = "CODEPIPELINE"
    }
}



resource "aws_codestarconnections_connection" "codestar" {
    name          = "express-app-connection"
    provider_type = "GitHub"
    tags = {
        Name = var.name
        Creator = var.creator
        Project = var.project
    }
}


resource "aws_codepipeline" "codepipeline" {
    name     = "express_app_pipeline"
    role_arn = aws_iam_role.codepipeline_role.arn
    artifact_store {
        location = var.s3_bucket
        type     = "S3"
    }

    stage {
        name = "Source"
        action {
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeStarSourceConnection"
        version          = "1"
        output_artifacts = ["source_output"]
        configuration = {
            ConnectionArn    = aws_codestarconnections_connection.codestar.arn
            FullRepositoryId = "${var.github_repo_owner}/${var.github_repo_name}"
            BranchName       = var.github_branch
            }
        run_order = 1
        }
    }

    stage {
        name = "Build"
        action {
        name             = "Build"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["source_output"]
        output_artifacts = ["build_output"]
        version          = "1"
        configuration = {
            ProjectName = "${aws_codebuild_project.express_app.name}"
            }
        run_order = 1
        }
    }

    stage {
        name = "Manual-Approval"

        action {
        run_order = 1
        name             = "AWS-Admin-Approval"
        category         = "Approval"
        owner            = "AWS"
        provider         = "Manual"
        version          = "1"
        input_artifacts  = []
        output_artifacts = []

        configuration = {
            CustomData = "Please verify the terraform plan output on the Plan stage and only approve this step if you see expected changes!"
            }
        }
    }

    stage {
        name = "Deploy"
        action {
        name            = "Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "ECS"
        version         = "1"
        input_artifacts = ["build_output"]

        configuration = {
            ClusterName = var.cluster_name
            ServiceName = var.service_name
            FileName    = "imagedefinitions.json"
            }
        }
    }
}

