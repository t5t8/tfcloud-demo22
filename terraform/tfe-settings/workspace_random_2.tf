resource "tfe_workspace" "random_2" {
  name        = "random_demo_02"
  description = "Workspace for random demo resources."
  tag_names   = ["random", "demo"]

  organization = tfe_organization.main.name

  allow_destroy_plan    = false ## We will not destroy this
  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = true
  global_remote_state   = true
  vcs_repo {
    identifier     = var.github_repo_name
    branch         = "develop01"
    oauth_token_id = tfe_oauth_client.main.oauth_token_id
  }
  working_directory             = "/terraform/random_2"
  queue_all_runs                = true
  speculative_enabled           = true
  structured_run_output_enabled = true
  # terraform_version             = "1.2.2" ## could be defined or latest
}

resource "tfe_variable" "random_2" {
  for_each     = local.variables_random_2
  workspace_id = tfe_workspace.random_2.id
  sensitive    = each.value.sensitive
  key          = each.key
  value        = each.value.value
  category     = each.value.category
  description  = each.value.description
  hcl          = each.value.hcl

  lifecycle { ignore_changes = [value] }
}
locals {
  variables_random_2 = {
    "tfe_organization_name" = {
      sensitive   = false
      value       = var.tfe_organization_name
      hcl         = false
      category    = "terraform"
      description = "tfe org for remote states"
    }
    "random_workspace" = {
      sensitive   = false
      value       = tfe_workspace.random.name
      hcl         = false
      category    = "terraform"
      description = "workspace for remote states"
    }
  }
}