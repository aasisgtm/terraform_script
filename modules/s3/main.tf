resource "aws_s3_bucket" "codepipeline_bucket" {
    bucket = "express-app-artifact-store-${terraform.workspace}"
    acl    = "private"
}