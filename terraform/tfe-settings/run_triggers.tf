## This trigger ensures workspace random_2 gets triggered
## always when workspace random run is completed.

resource "tfe_run_trigger" "random_2" {
  workspace_id  = tfe_workspace.random_2.id
  sourceable_id = tfe_workspace.random.id
}