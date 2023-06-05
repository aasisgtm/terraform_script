# ## S3 bucket to use it as backend to store state file

# resource "aws_s3_bucket" "state_bucket" {

#   bucket = var.bucket_name
#   acl    = "private"
# }

# ## Dynamodb table to use for state locking

# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
#   name           = var.dynamodb_table_name
#   hash_key       = "LockID"
#   read_capacity  = 20
#   write_capacity = 20

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
