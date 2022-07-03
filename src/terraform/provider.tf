#
# Don't use a remote store for such a simple project
#
terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.28.0"
    }
  }
}

#
# Linode token must be stored in environment variable LINODE_TOKEN
#
provider "linode" {
}
