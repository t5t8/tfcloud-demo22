variable "tfe_organization_name" {
  type        = string
  description = "Name of tfe organization."
}

variable "tfe_organization_email" {
  type        = string
  description = "Email for tfe organization contact."
}

variable "tfe_organization_members" {
  type        = list(string)
  description = "List of members to invite to organization"
}

variable "github_pat" {
  type        = string
  description = "Github personal access token to connect vcs"
}

variable "github_repo_name" {
  type        = string
  description = "Github repository path"
}

variable "branch_name" {
  type        = string
  description = "Branch name to use in all workspaces"
  default     = "main"
}