resource "tfe_organization" "main" {
  name  = var.tfe_organization_name
  email = var.tfe_organization_email
}

## TFE team and membership resources require entitlement to create teams and this
## can not be managed via tfe provider. You need to enable either free trial or team level
## plan in app.terraform.io

resource "tfe_team" "demo" {
  name         = "tfe_demo_team"
  organization = tfe_organization.main.name
  organization_access {
    manage_modules          = false
    manage_policies         = false
    manage_policy_overrides = false
    manage_providers        = false
    manage_run_tasks        = false
    manage_vcs_settings     = false
    manage_workspaces       = true
  }
}


resource "tfe_organization_membership" "main" {
  for_each     = toset(var.tfe_organization_members)
  organization = tfe_organization.main.name
  email        = each.value
}


resource "tfe_team_organization_member" "main" {
  for_each                   = toset(var.tfe_organization_members)
  team_id                    = tfe_team.demo.id
  organization_membership_id = tfe_organization_membership.main[each.key].id
}


resource "tfe_oauth_client" "main" {
  name             = "my-github-oauth-client"
  organization     = tfe_organization.main.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_pat
  service_provider = "github"
}