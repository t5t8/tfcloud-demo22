resource "tfe_workspace" "random" {
  name        = "random_demo"
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
  working_directory             = "/terraform/random"
  queue_all_runs                = true
  speculative_enabled           = true
  structured_run_output_enabled = true
  # terraform_version             = "1.2.2" ## could be defined or latest
}