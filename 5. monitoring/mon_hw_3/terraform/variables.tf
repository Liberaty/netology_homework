###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "vm_web_family" {
  type = string
  default = "ubuntu-2204-lts-oslogin"
}

# variable "ansible_inventory_path" {
#   description = "Путь к ansible inventory относительно каталога Terraform (или абсолютный)"
#   type        = string
#   default     = "../ansible/inventory/inventory.yml"
# }

# Переменные для описания конфигураций ВМ Ubuntu
variable "ubuntu_vm_config" {
  type = list(object({
    name          = string
    platform_id   = string
    zone          = string
    nat_ip        = bool
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    name_disk     = string
    hdd_type      = string
  }))
  default = [
    {
      name          = "ubuntu"
      platform_id   = "standard-v3"
      zone          = "ru-central1-a"
      nat_ip        = true
      cores         = 4
      memory        = 8
      core_fraction = 50
      hdd_size      = 30
      name_disk     = "HDD"
      hdd_type      = "network-hdd"
    },
    {
      name          = "ubuntu"
      platform_id   = "standard-v3"
      zone          = "ru-central1-a"
      nat_ip        = true
      cores         = 2
      memory        = 2
      core_fraction = 20
      hdd_size      = 12
      name_disk     = "HDD"
      hdd_type      = "network-hdd"
    }
  ]
}

# Переменные для описания конфигураций ВМ Ubuntu
# variable "centos_vm_config" {
#   type = list(object({
#     name          = string
#     platform_id   = string
#     zone          = string
#     nat_ip        = bool
#     cores         = number
#     memory        = number
#     core_fraction = number
#     hdd_size      = number
#     name_disk     = string
#     hdd_type      = string
#   }))
#   default = [
#     {
#       name          = "centos9"
#       platform_id   = "standard-v3"
#       zone          = "ru-central1-a"
#       nat_ip        = true
#       cores         = 2
#       memory        = 4
#       core_fraction = 100
#       hdd_size      = 12
#       name_disk     = "HDD"
#       hdd_type      = "network-hdd"
#     },
#     {
#       name          = "centos9"
#       platform_id   = "standard-v3"
#       zone          = "ru-central1-a"
#       nat_ip        = true
#       cores         = 2
#       memory        = 4
#       core_fraction = 20
#       hdd_size      = 12
#       name_disk     = "HDD"
#       hdd_type      = "network-hdd"
#     },
#     {
#       name          = "centos9"
#       platform_id   = "standard-v3"
#       zone          = "ru-central1-a"
#       nat_ip        = true
#       cores         = 2
#       memory        = 4
#       core_fraction = 50
#       hdd_size      = 15
#       name_disk     = "HDD"
#       hdd_type      = "network-hdd"
#     }
#   ]
# }

# variable "vm_db_config" {
#   type = list(object({
#     name          = string
#     platform_id   = string
#     zone          = string
#     nat_ip        = bool
#     cpu           = number
#     ram           = number
#     core_fraction = number
#     disk_size     = number
#     name_disk     = string
#     hdd_type      = string
#   }))
#   default = [
#     {
#       name          = "main"
#       platform_id   = "standard-v3"
#       zone          = "ru-central1-a"
#       nat_ip        = true
#       cpu           = 4
#       ram           = 6
#       core_fraction = 50
#       disk_size     = 25
#       name_disk     = "SSD"
#       hdd_type      = "network-ssd"
#     },
#     {
#       name          = "replica"
#       platform_id   = "standard-v3"
#       zone          = "ru-central1-a"
#       nat_ip        = true
#       cpu           = 2
#       ram           = 4
#       core_fraction = 20
#       disk_size     = 25
#       name_disk     = "SSD"
#       hdd_type      = "network-ssd"
#     }
#   ]
# }

# variable "vm_storage_config" {
#   type = list(object({
#     name          = string
#     platform_id   = string
#     zone          = string
#     nat_ip        = bool
#     cores         = number
#     memory        = number
#     core_fraction = number
#     hdd_size      = number
#     name_disk     = string
#     hdd_type      = string
#   }))
#   default = [
#     {
#       name          = "storage"
#       platform_id   = "standard-v3"
#       zone          = "ru-central1-a"
#       nat_ip        = true
#       cores         = 2
#       memory        = 2
#       core_fraction = 20
#       hdd_size      = 10
#       name_disk     = "HDD"
#       hdd_type      = "network-hdd"
#     },
#   ]
# }