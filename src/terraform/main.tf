#
# Generare a random root password.
#
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "linode_instance" "htb00" {
  label           = "htb00.${var.linode_domain}"
  image           = var.linode_image
  region          = var.linode_region
  type            = var.linode_type
  authorized_keys = [var.linode_authorized_key]
  root_pass       = random_password.password.result
  tags            = var.linode_tags
}

#
# Drop all incomming traffic, except SSH from my home IP address.
# Accept all outgoning traffic.
#
resource "linode_firewall" "firewall" {
  label = "dcpr"

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["141.224.229.148/32"]
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [
    linode_instance.htb00.id
  ]
}
