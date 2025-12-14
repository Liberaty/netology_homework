resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    ubuntu      = yandex_compute_instance.ubuntu
  })
  filename = "ansible_inventory.ini"
}

# Version 1
# resource "null_resource" "provision_web" {
#   depends_on = [
#     #yandex_compute_instance.web,
#     local_file.inventory
#   ]

# provisioner "local-exec" {
#     command = "echo 'Inventory file created successfully!'"
#   }

#   triggers = {
#     always_run        = timestamp()                         
#     playbook_src_hash = file("${abspath(path.module)}/playbook.yml") 
#     ssh_public_key    = "ubuntu:${local.ssh_public_key}"                          
#   }
# }

# Version 2
# resource "null_resource" "add_ssh_keys" {
#   depends_on = [yandex_compute_instance.ubuntu, local_file.inventory]

#   provisioner "local-exec" {
#     command = <<EOT
#       # Ждем, пока все хосты станут доступны
#       for ip in ${join(" ", yandex_compute_instance.ubuntu[*].network_interface[0].nat_ip_address)}; do
#         until ssh -o ConnectTimeout=5 -q ubuntu@$ip exit; do
#           echo "Waiting for $ip to become available..."
#           sleep 5
#         done
#         echo "Adding $ip to known_hosts..."
#         ssh-keyscan -H $ip >> ~/.ssh/known_hosts
#       done
#     EOT
#   }
# }