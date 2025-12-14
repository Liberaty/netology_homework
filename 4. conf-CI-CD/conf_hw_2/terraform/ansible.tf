locals {
  centos_instances = yandex_compute_instance.centos

  # Разделяем хосты по группам
  sonarqube_hosts = [local.centos_instances[0]] # Первый хост
  postgres_hosts = [local.centos_instances[1]] # Второй хост
  nexus_hosts = [local.centos_instances[2]] # Третий хост
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    sonarqube_hosts = local.sonarqube_hosts
    postgres_hosts = local.postgres_hosts
    nexus_hosts = local.nexus_hosts
  })

  filename = "${path.module}/infrastructure/inventory/cicd/hosts.yml"
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