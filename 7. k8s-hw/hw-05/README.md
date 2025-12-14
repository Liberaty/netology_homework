# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2» - Лепишин Алексей

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к двум приложениям снаружи кластера по разным путям.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://microk8s.io/docs/getting-started) по установке MicroK8S.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Service.
3. [Описание](https://kubernetes.io/docs/concepts/services-networking/ingress/) Ingress.
4. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
#
***Ответ***

Создаём манифест [**frontend-deployment.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/frontend-deployment.yaml) с образом nginx и количеством реплик 3шт.

![1.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/1.1.png?raw=true)

2. Создать Deployment приложения _backend_ из образа multitool. 
#
***Ответ***

Создаём манифест [**backend-deployment.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/backend-deployment.yaml) с образом multitool.

![1.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/1.2.png?raw=true)

3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.
#
***Ответ***

Создаём манифесты [**backend-service.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/backend-service.yaml) и [**frontend-service.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/frontend-service.yaml).

![1.3.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/1.1.png?raw=true)

4. Продемонстрировать, что приложения видят друг друга с помощью Service.
#
***Ответ***

Сначала проверяю статус всех подов и сервисов

![1.4.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/1.4.1.png?raw=true)

Далее, используя backend под, тестирую доступ к сервисам

![1.4.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/1.4.2.png?raw=true)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
#
***Ответ***

Включил ingress командой `microk8s.enable ingress`

![2.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/2.1.png?raw=true)

2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
#
***Ответ***

Создаём манифест [**ingress.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/ingress.yaml) и запускаем его.

![2.2.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/2.2.1.png?raw=true)

И теперь смотрим статус

![2.2.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/2.2.2.png?raw=true)

3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
#
***Ответ***

Проверяем доступность адресов по IP адресу с ноды.

![2.3.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-05/img/2.3.png?raw=true)


4. Предоставить манифесты и скриншоты или вывод команды п.2.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Правила приема работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl` и скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------