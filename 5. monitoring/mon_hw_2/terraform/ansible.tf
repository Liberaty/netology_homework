locals {
  ubuntu_instances = yandex_compute_instance.ubuntu

  # Разделяем хосты по группам
  prometheus_hosts = [local.ubuntu_instances[0]] # Первый хост
  alertmanager_hosts = [local.ubuntu_instances[1]] # Второй хост
  grafana_hosts = [local.ubuntu_instances[2]] # Третий хост
  node_exporter_hosts = [local.ubuntu_instances[3]] # четвёртый хост
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    prometheus_hosts = local.prometheus_hosts
    alertmanager_hosts = local.alertmanager_hosts
    grafana_hosts = local.grafana_hosts
    node_exporter_hosts = local.node_exporter_hosts
  })

  filename = "${path.root}/${var.ansible_inventory_path}"
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