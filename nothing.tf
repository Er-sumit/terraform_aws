# An example resource that does nothing.
resource "null_resource" "nothing" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}