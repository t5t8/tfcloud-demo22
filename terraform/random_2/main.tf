data "tfe_outputs" "random" {
  organization = var.tfe_organization_name
  workspace    = var.random_workspace
}

resource "random_pet" "main" {
  count = data.tfe_outputs.random.values.random_integer
}

output "random_pet_name" {
  count = data.tfe_outputs.random.values.random_integer
  value = random_pet.main.id[count.index]
}