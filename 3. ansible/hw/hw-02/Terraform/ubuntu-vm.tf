# Создание одинаковых ВМ (количество в зависимости от count)
resource "yandex_compute_instance" "ubuntu" {
  count        = 2
  name         = "${var.ubuntu_vm_config[count.index].name}-${count.index + 1}" # Генерация name
  hostname     = "${var.ubuntu_vm_config[count.index].name}-${count.index + 1}" # Генерация hostname
  platform_id  = var.ubuntu_vm_config[count.index].platform_id
  zone         = var.ubuntu_vm_config[count.index].zone

  resources {
    cores         = var.ubuntu_vm_config[count.index].cores
    memory        = var.ubuntu_vm_config[count.index].memory
    core_fraction = var.ubuntu_vm_config[count.index].core_fraction
  }

  boot_disk {
    initialize_params {
      # image_id  = data.yandex_compute_image.ubuntu.image_id # Ubuntu 20.04 LTS
      image_id  = data.yandex_compute_image.ubuntu.id
      size      = var.ubuntu_vm_config[count.index].hdd_size
      type      = var.ubuntu_vm_config[count.index].hdd_type
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.ubuntu_vm_config[count.index].nat_ip
    # security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}" # Добавляем SSH-ключ для пользователя ubuntu
  }

  # depends_on = [yandex_compute_instance.db, yandex_compute_instance.storage] # Ожидаем создания ВМ из других групп
}