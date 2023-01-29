/*

variable "availability_zones" {
  type = list(string)
}
*/

variable "ipv4_primary_cidr_block" {
  type = string
}

variable "ipv4_additional_cidr_block_associations" {
  type = map(any)
}

variable "default_security_group_deny_all" {
  type    = bool
  default = false
}

variable "default_route_table_no_routes" {
  type    = bool
  default = false
}

variable "default_network_acl_deny_all" {
  type    = bool
  default = false
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
}
