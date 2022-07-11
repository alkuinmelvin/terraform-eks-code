resource "random_id" "id1" {
  byte_length = 8
}

output "tfid" {
  value = random_id.id1.hex
}

