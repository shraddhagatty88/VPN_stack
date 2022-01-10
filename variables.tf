############################################################################
# Variables:
############################################################################

############################################################################
# Tenancy:
############################################################################

variable "tenancy_ocid" {}
#variable "user_ocid" {}
#variable "fingerprint" {}
#variable "private_key_path" {}
variable "region" {}
variable "customer_label" {}
variable "compartment_id" {}
variable "drg_id" {}


############################################################################
# VPN:
############################################################################

locals {
  vpns = {
    v1_cl = {
      compartment_id       = var.compartment_id
      cpe_ip_address       = var.v1_cl_vpn
      ip_sec_drg_id        = var.drg_id
      ip_sec_static_routes = [var.v1_cl_domain]
    }
    v1_cw = {
      compartment_id       = var.compartment_id
      cpe_ip_address       = var.v1_cw_vpn
      ip_sec_drg_id        = var.drg_id
      ip_sec_static_routes = [var.v1_cw_domain]
    }
    cust1 = {
      compartment_id       = var.compartment_id
      cpe_ip_address       = var.cust1_vpn
      ip_sec_drg_id        = var.drg_id
      ip_sec_static_routes = var.cust1_domain
    }
    cust2 = {
      compartment_id       = var.compartment_id
      cpe_ip_address       = var.cust2_vpn
      ip_sec_drg_id        = var.drg_id
      ip_sec_static_routes = var.cust2_domain
    }
  }
}

############################################################################
###########################################
#VPN
###########################################
locals {

v1_vpns = ["${var.v1_cl_vpn}","${var.v1_cw_vpn}"]
cust_vpns = ["${var.cust1_vpn}","${var.cust2_vpn}"]
v1_domains = flatten([var.v1_cl_domain, var.v1_cw_domain])
cust_domains = flatten([var.cust1_domain, var.cust2_domain])

}

variable "v1_cl_vpn" {}
variable "v1_cw_vpn" {}


variable "cust1_vpn" {}
variable "cust2_vpn" {}

variable "v1_cl_domain" {
  type        = list(string)
  description = "List of on-premises CIDR blocks allowed to connect to the Landing Zone network via a DRG."
  default     = []
}
variable "v1_cw_domain" {
  type        = list(string)
  description = "List of on-premises CIDR blocks allowed to connect to the Landing Zone network via a DRG."
  default     = []
}

variable "cust1_domain" {
  type        = list(string)
  description = "List of on-premises CIDR blocks allowed to connect to the Landing Zone network via a DRG."
  default     = []
}
variable "cust2_domain" {
  type        = list(string)
  description = "List of on-premises CIDR blocks allowed to connect to the Landing Zone network via a DRG."
  default     = []
}
/*
variable "cust_vpns"{
  type        = list(string)
  description = "List of customer vpns"
  default     = []
}
variable "v1_vpns" {
  type        = list(string)
  description = "List of version 1 vpns"
  default     = []
  
}

variable "v1_domains" {
  type        = list(string)
  description = "V1 Domain"
  default     = [] 
}

variable "cust_domains" {
  type        = list(string)
  description = "List of on-premises CIDR blocks allowed to connect to the Landing Zone network via a DRG."
  default     = [] 
}


v1_vpns = ["${var.v1_cl}","${var.v1_cw}"]
cust_vpns = ["${var.cust1_vpn}","${var.cust2_vpn}"]
v1_domains = flatten(var.v1_cl_domain, var.v1_cw_domain)
cust_domains = flatten(var.cust1_domin, var.cust2.domain)

*/
variable "access" {

  type        = list(string)
  description = "List of access IPs allowed to connect "
  default     = []

}
############################################################################

