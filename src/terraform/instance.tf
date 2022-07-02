resource "linode_instance" "htb00" {
  image           = var.linode_image
  region          = var.linode_region
  type            = var.linode_type
  authorized_keys = [var.linode_authorized_key]
  root_pass       = random_password.password.result
  label           = "htb"
  group           = "htb"
}
