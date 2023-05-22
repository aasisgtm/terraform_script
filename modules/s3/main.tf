resource "aws_s3_bucket" "codepipeline_bucket" {
    bucket = "express-artifact"
    acl    = "private"
}