# ============================================================ REQUIRED

variable "domain" {
  type        = string
  description = "An Azure hosted DNS domain to use for DNS records"
}

variable "key_vault_name" {
  type        = string
  description = "The name of an existing key vault to use for certificate generation."
}

variable "license_file" {
  type        = string
  description = "Path to the Replicated license file."
}

variable "resource_group_name" {
  type        = string
  description = "An existing Azure Resource Group to deploy into."
}

variable "subnet" {
  type        = string
  description = "An existing Azure Subnet to deploy into"
}

variable "tls_pfx_certificate" {
  type        = string
  description = "The path to a PFX certificate for front end SSL communication."
}

variable "tls_pfx_certificate_password" {
  type        = string
  description = "The password for the associated SSL certificate."
}

variable "virtual_network_name" {
  type        = string
  description = "An existing Azure Virtual Network to deploy into"
}

# ============================================================ OPTIONAL

variable "release_sequence" {
  type        = string
  description = "The sequence ID for the Terraform Enterprise version to pin the cluster to."
  default     = "latest"
}

variable "resource_prefix" {
  type        = string
  description = "Prefix name for resources created by this module"
  default     = "tfe"
}

variable "airgap_installer_url" {
  type        = string
  description = "URL to replicated's airgap installer package"
  default     = "https://install.terraform.io/installer/replicated-v5.tar.gz"
}

variable "airgap_mode_enable" {
  type        = bool
  description = "install in airgap mode"
  default     = false
}

variable "airgap_package_url" {
  type        = string
  description = "Signed URL to download the package"
  default     = ""
}

variable "ca_bundle_url" {
  type        = string
  description = "URL to Custom CA bundle used for outgoing connections"
  default     = ""
}

variable "azure_es_account_key" {
  type        = string
  description = "The Azure account key for external services"
  default     = ""
}

variable "azure_es_account_name" {
  type        = string
  description = "The Azure account name for external services"
  default     = ""
}

variable "azure_es_container" {
  type        = string
  description = "The Azure container for external services"
  default     = ""
}

variable "distribution" {
  type        = string
  description = "Type of linux distribution to use. (ubuntu or rhel)"
  default     = "ubuntu"
}

variable "dns_ttl" {
  type        = string
  description = "The TTL for dns records."
  default     = "120"
}

variable "domain_resource_group_name" {
  type        = string
  description = "The name of the resource group where the domain name resides, if not set the main resource group will be used."
  default     = ""
}

variable "encryption_password" {
  type        = string
  description = "The password for data encryption in non-external services modes."
  default     = ""
}

variable "hostname" {
  description = "Hostname for loadbalancer frontend to use, otherwise will default to 'tfe-$install_id.domain.com'"
  default     = ""
}

variable "http_proxy_url" {
  type        = string
  description = "HTTP(S) Proxy URL"
  default     = ""
}

variable "iact_subnet_list" {
  type        = list(string)
  description = "List of IP Cidr Mask to allow to access Initial Admin Creation Token (IACT) API. [Terraform Docs](https://www.terraform.io/docs/enterprise/private/automating-initial-user.html)"
  default     = []
}

variable "iact_subnet_time_limit" {
  type        = string
  description = "Amount of time to allow access to IACT API after initial boot"
  default     = ""
}

variable "import_key" {
  type        = string
  description = "An additional ssh pub key to import to all machines"
  default     = ""
}

variable "installer_url" {
  type        = string
  description = "URL to the cluster setup tool"
  default     = "https://install.terraform.io/installer/ptfe-0.1.zip"
}

variable "key_vault_resource_group_name" {
  type        = string
  description = "The existing Azure Resource Group where the key vault is stored, defaults to the main resource group if not set."
  default     = ""
}

variable "os_disk_size" {
  type        = string
  description = "The size in Gb for the OS disk of the primary seed virtual machine"
  default     = "100"
}

variable "postgresql_address" {
  type        = string
  description = "address to connect to external postgresql database at"
  default     = ""
}

variable "postgresql_database" {
  type        = string
  description = "database name to use in exetrnal postgresql database"
  default     = ""
}

variable "postgresql_extra_params" {
  type        = string
  description = "additional connection string parameters (must be url query params)"
  default     = ""
}

variable "postgresql_password" {
  type        = string
  description = "password to connect to external postgresql database as"
  default     = ""
}

variable "postgresql_user" {
  type        = string
  description = "user to connect to external postgresql database as"
  default     = ""
}

# We are hardcoding the primary count to 3 for the initial release for stability.
# variable "primary_count" {
#   description = "The number of primary virtual machines to create, should be set to 3 or 5."
#   default     = 3
# }

variable "primary_vm_size" {
  type        = string
  description = "The Azure VM Size to use."
  default     = "Standard_D4s_v3"
}

variable "secondary_count" {
  type        = number
  description = "The number of secondary virtual machines to create."
  default     = 5
}

variable "secondary_vm_size" {
  type        = string
  description = "The Azure VM Size to use (will use primary_vm_size if not set)."
  default     = ""
}

variable "ssh_user" {
  type        = string
  description = "The ssh user to create"
  default     = "ubuntu"
}

variable "storage_image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "A list of the data to define the os version image to build from"

  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

variable "tls_pfx_certificate_key_size" {
  type        = number
  description = "The size of the Key used in the Certificate. Possible values include 2048 and 4096."
  default     = 2048
}

variable "tls_pfx_certificate_key_type" {
  type        = string
  description = "Specifies the Type of Key, such as RSA."
  default     = "RSA"
}

variable "virtual_network_resource_group_name" {
  type        = string
  description = "The existing Azure Resource Group where the virtual network resides, defaults to the main resource group if not set."
  default     = ""
}

variable "vm_size_tier" {
  type        = string
  description = "The tier for the vms (must be 'Standard' or 'Basic') and must match with vm_size"
  default     = "Standard"
}

variable "weave_cidr" {
  type        = string
  description = "Specify a non-standard CIDR range for weave. The default is 10.32.0.0/12"
  default     = ""
}

variable "repl_cidr" {
  type        = string
  description = "Specify a non-standard CIDR range for the replicated services. The default is 10.96.0.0/12"
  default     = ""
}

variable "additional_tags" {
  type        = map
  description = "A map of additional tags to attach to all resources created."
  default     = {}
}

locals {
  prefix           = "${var.resource_prefix}-${random_string.install_id.result}"
  cluster_hostname = "${coalesce(var.hostname, local.prefix)}.${var.domain}"
}
