variable "vm_hostname" {
  description = "Name of the computer"
  type = string
}

variable "os_disk_size" {
  description = "OS Disk size"
  type = number
}

variable "admin_username" {
  description = "Admin user"
  type = string
  default = "admin"
}

variable "admin_password" {
  description = "Admin password"
  type = string
  default = "Pass@word@123"
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type = string
}

variable "subnet_name" {
  description = "Subnet name"
  type = string
}