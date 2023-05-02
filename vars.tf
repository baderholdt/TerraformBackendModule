##########################################################################################
####################################### main.tf ##########################################
##########################################################################################

variable "resource_group_name" {
  type        = string
}

variable "resource_group_location" {
  type        = string
}

variable "virtual_network_name" {
  type        = string
}

variable "network_interface_name" {
  type        = string
}

variable "virtual_machine_name" {
  type        = string
}

variable "virtual_machine_size" {
  type        = string
}

variable "virtual_machine_iso_publisher" {
  type        = string
}

variable "virtual_machine_iso_offer" {
  type        = string
}

variable "virtual_machine_iso_sku" {
  type        = string
}

variable "virtual_machine_iso_version" {
  type        = string
}