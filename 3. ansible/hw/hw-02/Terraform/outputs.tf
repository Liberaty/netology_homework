# output "info_of_vm" {
#     value = [
#         {vm_ubuntu = ["${yandex_compute_instance.ubuntu.name}", "ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.ubuntu.network_interface[0].nat_ip_address}", "${yandex_compute_instance.ubuntu.fqdn}"]},
#         {vm_db  = ["${yandex_compute_instance.centos.name}", "ssh -o 'StrictHostKeyChecking=no' root@${yandex_compute_instance.centos.network_interface[0].nat_ip_address}", "${yandex_compute_instance.centos.fqdn}"]}
#     ]
# }