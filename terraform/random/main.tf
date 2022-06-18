## Creates a random integer and outputs it for other workspaces.

resource "random_integer" "main" {
  min = var.min
  max = var.max
}

output "random_integer" {
  value = random_integer.main.id
}