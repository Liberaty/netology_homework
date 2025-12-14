# Домашнее задание к занятию «Хранение в K8s. Часть 2» - Лепишин Алексей

### Цель задания

В тестовой среде Kubernetes нужно создать PV и продемострировать запись и хранение файлов.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным GitHub-репозиторием.

------

### Дополнительные материалы для выполнения задания

1. [Инструкция по установке NFS в MicroK8S](https://microk8s.io/docs/nfs). 
2. [Описание Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/). 
3. [Описание динамического провижининга](https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/). 
4. [Описание Multitool](https://github.com/wbitt/Network-MultiTool).

------

### Задание 1

**Что нужно сделать**

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
#
***Ответ***

Создаём манифест [**deployment.yaml**](https://github.com/Liberaty/k8s_hw_07/blob/main/deployment.yaml) и запускаем его

![1.1.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.1.png?raw=true)

2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
#
***Ответ***

Создаём манифесты [**local-pv.yaml**](https://github.com/Liberaty/k8s_hw_07/blob/main/local-pv.yaml) и [**local-pvc.yaml**](https://github.com/Liberaty/k8s_hw_07/blob/main/local-pvc.yaml) потом запускаем их и проверяем их статус

![1.2.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.2.png?raw=true)

3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории.
#
***Ответ***

Проверка работы busybox

![1.3.1.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.3.1.png?raw=true)

Проверяем логи multitool

![1.3.2.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.3.2.png?raw=true)

Видим что всё работает.

4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
#
***Ответ***

Удаляю Deployment и PVC

![1.4.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.4.png?raw=true)

После удалении Deployment и PVC видим, что PV перешел в состояние Failed, т.к. контроллер PV не сумел удалить данные по пути /mnt/local-storage/busybox-multitool

5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
#
***Ответ***

На скриншоте ниже видно, что файл всё ещё содержит записи и файл success существует

![1.5.1.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.5.1.png?raw=true)

После удаления PV всё так же видно, что файл всё ещё содержит записи и файл success существует

![1.5.2.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/1.5.2.png?raw=true)

Так происходит из-за особенностей работы контроллера PV с hostPath

6. Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Задание 2

**Что нужно сделать**

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.
#
***Ответ***

NFS настроил

![2.1.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/2.1.png?raw=true)

2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
#
***Ответ***

![2.2.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/2.2.png?raw=true)

3. Продемонстрировать возможность чтения и записи файла изнутри пода. 
#
***Ответ***

![2.3.png](https://github.com/Liberaty/k8s_hw_07/blob/main/img/2.3.png?raw=true)

4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.