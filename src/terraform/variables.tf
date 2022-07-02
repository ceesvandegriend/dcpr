variable "linode_image" {
  type     = string
  nullable = false
  default  = "linode/debian11"
}

variable "linode_region" {
  type     = string
  nullable = false
  default  = "eu-central"
}

variable "linode_type" {
  type     = string
  nullable = false
  default  = "g6-nanode-1"
}

variable "linode_authorized_key" {
  type     = string
  nullable = false
  default  = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvNnUk4qfyrulUyB5e2U2NSBKD/DR1NILlfD5a3X2tq cees@griend.eu"
}

variable "linode_tags" {
  default = [ "dcpr" ]
}
