resource "aws_amplify_app" "react-app" {
  name         = "amplify-app-aasis"
  repository   = var.git_repository
  access_token = var.access_token

  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  tags = {
    Name    = var.name
    Project = var.project
    Creator = var.creator
  }
}

resource "aws_amplify_branch" "main" {
  app_id            = aws_amplify_app.react-app.id
  branch_name       = "main"
  enable_auto_build = true
}

