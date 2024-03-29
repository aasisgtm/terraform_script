
variable "project" {
  type = string
  default     = "devops"
  description = "Tag for project"
}

variable "creator" {
  default     = "aashish"
  description = "Tag for creator"
}

variable "name" {
  default     = "aashish-amplify-app"
  description = "Tag for amplify app"
}

variable "git_repository" {
  type        = string
  default     = "https://github.com/aashishgautam/amplifyapp"
  description = "Github repository url for FE app"
}

variable "access_token" {
  type        = string
  default     = "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"
  description = "Oauth token to access github repo for FE app"
}

# variable "oauth_token" {
#   type        = string
#   default     = "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"
#   description = "Oauth token to access github repo for FE app"
# }