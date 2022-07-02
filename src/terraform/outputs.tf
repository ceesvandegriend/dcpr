output "ip_address" {
  value = linode_instance.htb00.ip_address
}

output "password" {
    value = random_password.password.result
    sensitive = true
}
