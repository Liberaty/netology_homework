# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1» - Лепишин Алексей

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к приложению, установленному в предыдущем ДЗ и состоящему из двух контейнеров, по разным портам в разные контейнеры как внутри кластера, так и снаружи.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Описание Service.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
#
***Ответ***
Создаём манифест [**deployment.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/deployment.yaml) с двумя контейнерами и тремя репликами
#
![1.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/img/1.1.png?raw=true)
#
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
#
***Ответ***
Создаём манифест [**service.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/service.yaml) с необходимыми портами
#
![1.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/img/1.2.png?raw=true)
#
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
#
***Ответ***
Создаём манифест [**multitool.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/multitool.yaml) для отдельного Pod'a с приложением multitool, чтобы убедиться с помощью curl, что из пода есть доступ до приложения по портам 9001 и 9002 в разные контейнеры.
#
![1.3.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/img/1.3.png?raw=true)
#
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
#
***Ответ***
#
![1.4.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/img/1.4.png?raw=true)
#
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.
#
***Ответ***
#
Все ссылки предоставлены выше.
#
------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
#
***Ответ***
#
Создаём манифест [**service-nodeport.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/service-nodeport.yaml) и создаём по нему сервис **nodeport-service**
#
![2.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/img/2.1.png?raw=true)
#
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
#
***Ответ***
#
![2.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-04/img/2.2.png?raw=true)
#
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.
#
***Ответ предоставлен выше***
#
------

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl` и скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.