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
