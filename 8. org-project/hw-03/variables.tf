###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  sensitive   = true
}

variable "bucket_name" {
  description = "Name for the storage bucket"
  type        = string
  default     = "lepishin-12112025"
}

variable "image_path" {
  description = "Path to local image file"
  type        = string
  default     = "image.jpg"
}

variable "kms_key_name" {
  description = "Name of the KMS key"
  type        = string
  default     = "s3-encryption-key"
}
