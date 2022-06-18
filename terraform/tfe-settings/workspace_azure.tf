resource "tfe_workspace" "azure_demo" {
  name        = "azure_demo"
  description = "Workspace for azure demo resources."
  tag_names   = ["azure", "demo"]

  organization = tfe_organization.main.name

  allow_destroy_plan    = false ## We will not destroy this
  auto_apply            = false
  execution_mode        = "remote"
  file_triggers_enabled = true
  global_remote_state   = true
  vcs_repo {
    identifier     = var.github_repo_name
    branch         = "develop01"
    oauth_token_id = tfe_oauth_client.main.oauth_token_id
  }
  working_directory             = "/terraform/azure"
  queue_all_runs                = true
  speculative_enabled           = true
  structured_run_output_enabled = true
  # terraform_version             = "1.2.2" ## could be defined or latest
}

resource "tfe_variable" "azure_demo" {
  for_each     = local.variables_azure_demo
  workspace_id = tfe_workspace.azure_demo.id
  sensitive    = each.value.sensitive
  key          = each.key
  value        = each.value.value
  category     = each.value.category
  description  = each.value.description
  hcl          = each.value.hcl

  lifecycle { ignore_changes = [value] }
}

## Setup azure required (sensitive) credentials as env vars and a 
## prefix for resources as terraform var.
locals {
  variables_azure_demo = {
    "ARM_SUBSCRIPTION_ID" = {
      sensitive   = true
      value       = "variable1"
      hcl         = false
      category    = "env"
      description = "The Subscription ID which should be used. "
    }
    "ARM_TENANT_ID" = {
      sensitive   = true
      value       = "variable1"
      hcl         = false
      category    = "env"
      description = "The Tenant ID should be used."
    }
    "ARM_CLIENT_ID" = {
      sensitive   = true
      value       = "variable1"
      hcl         = false
      category    = "env"
      description = "The Client ID which should be used. "
    }
    "ARM_CLIENT_SECRET" = {
      sensitive   = true
      value       = "variable1"
      hcl         = false
      category    = "env"
      description = "The Client Secret which should be used."
    }
    "prefix" = {
      sensitive   = false
      value       = "TFCLOUDDEMO062022"
      hcl         = false
      category    = "terraform"
      description = "Prefix for resources"
    }

  }
}