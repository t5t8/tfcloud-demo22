resource "tfe_organization" "main" {
  name  = var.tfe_organization_name
  email = var.tfe_organization_email
}



resource "tfe_organization_membership" "main" {
  for_each     = toset(var.tfe_organization_members)
  organization = tfe_organization.main.name
  email        = each.value
}


resource "tfe_oauth_client" "main" {
  name             = "my-github-oauth-client"
  organization     = tfe_organization.main.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_pat
  service_provider = "github"
}