resource "null_resource" "null-test" {
  provisioner "local-exec" {
    command = "echo VARS : ${var.null-test}"
  }
}

