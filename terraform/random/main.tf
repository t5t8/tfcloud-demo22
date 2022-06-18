## Creates a random integer and outputs it for other workspaces.

resource "random_integer" "main" {
  min = 4
  max = 5
}

output "random_integer" {
  value = random_integer.main.id
}