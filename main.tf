resource "null_resource" "feature-flag" {
    triggers = {
      environment = var.environment
      region      = var.region
      salt        = base64sha512(file("${path.module}/../.secrets/password"))
    }

    provisioner "local-exec" {
      command = "echo \"Flagging on ${var.environment}/${var.region}\""
    }
}
