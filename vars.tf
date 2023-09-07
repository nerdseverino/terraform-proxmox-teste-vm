#Provide the url of the host you would like the API to communicate on.
#It is safe to default to setting this as the URL for what you used
#as your `proxmox_host`, although they can be different
variable "api_url" {
}
#Blank var for use by terraform.tfvars
variable "token_secret" {
}
#Blank var for use by terraform.tfvars
variable "token_id" {
}
variable "ssh_key" {
}
variable "proxmox_host" {
}
variable "template_name" {
# Apenas descomente o template desejado  
#    default = "ubuntu-2004-cloudinit-template"
#    default = "ubuntu-2204-cloudinit-template"
#    default = "debian-bullseye-cloudinit-template"
    default = "debian-bookworm-cloudinit-template"
}
variable "memory" {
  type = number
  default = 2048
}
variable "cores" {
  type = number
  default = 2
}
variable "os_type" {
  default = "cloud-init"
}
variable "root_password" {
  default = "debian"
}
variable "pool" {
  default = "Teste"
}