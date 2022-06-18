resource "tfe_variable_set" "min_and_max" {
  name          = "Min and Max"
  description   = "Variables for min and max"
  organization  = tfe_organization.main.name
  workspace_ids = []
}

resource "tfe_variable" "min" {
  key             = "min"
  value           = "2"
  category        = "terraform"
  description     = "Minimum value between 1-8"
  variable_set_id = tfe_variable_set.min_and_max.id
}

resource "tfe_variable" "max" {
  key             = "max"
  value           = "4"
  category        = "terraform"
  description     = "Maximum value between 1-8"
  variable_set_id = tfe_variable_set.min_and_max.id
}