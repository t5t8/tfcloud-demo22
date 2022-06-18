resource "random_pet" "main" {
}

output "random_pet_name" {
  value = random_pet.main.id
}