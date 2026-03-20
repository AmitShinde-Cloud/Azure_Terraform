variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for vent & subnet deployments"
}
variable "resource_group_name" {
  description = "test_RG"
}
variable "vnet" {
  type        = string
  description = "vnet"
}
variable "subnet2" {
  type        = string
  description = "subnet"
}
variable "nic" {
  type        = string
  description = "nic"
}


variable "vm_name" {
  description = "Enter vm name"
}

variable "disk_name" {
  description = "Enter disk name"
}
variable "caching" {
  description = "Enter  caching"
}
variable "create_option" {
  description = "Enter create option"
}
variable "managed_disk_type" {
  description = "Enter disk type"
}
variable "publisher" {
  description = "publisher"
}
variable "offer" {
  description = "offer"
}
variable "sku" {
  description = "sku"
}

variable "computer_name" {
  description = "Enter computer name "
}
variable "admin_username" {
  description = "admin username "
}
variable "admin_password" {
  description = "admin password "
}
variable "vm_ipconfig" {
  description = "ipconfig name "
}
variable "vm_size" {
  description = "ipconfig name "
}

variable "subnet_id" {
  description = "subnet_id"
}