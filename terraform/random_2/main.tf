## Reads outputs from a workspace. 
data "tfe_outputs" "random" {
  organization = var.tfe_organization_name
  workspace    = var.random_workspace
}

## Using integer output from another workspace create * random pets.
resource "random_pet" "main" {
  count = data.tfe_outputs.random.values.random_integer
}

## Outputs all created random pet names.
output "random_pet_name" {
  value = random_pet.main[*].id
}