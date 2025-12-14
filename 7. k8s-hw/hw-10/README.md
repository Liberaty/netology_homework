# Домашнее задание к занятию «Helm» - Лепишин Алексей

### Цель задания

В тестовой среде Kubernetes необходимо установить и обновить приложения с помощью Helm.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение, например, MicroK8S.
2. Установленный локальный kubectl.
3. Установленный локальный Helm.
4. Редактор YAML-файлов с подключенным репозиторием GitHub.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://helm.sh/docs/intro/install/) по установке Helm. [Helm completion](https://helm.sh/docs/helm/helm_completion/).

------

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения.
#
***Ответ***

- Создаем чарт командой ```helm create myapp-chart```
- наполняем его templates файлами для деплоя nginx ([**nginx-deployment.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/myapp-chart/templates/nginx-deployment.yaml) и [**nginx-service.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/myapp-chart/templates/nginx-service.yaml)) и redis ([**redis-statefulset.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/myapp-chart/templates/redis-statefulset.yaml) и [**redis-service.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/myapp-chart/templates/redis-service.yaml)). Также изменяем файлы [**Chart.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/myapp-chart/Chart.yaml) и [**values.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/myapp-chart/values.yaml)

![1.1.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/1.1.png?raw=true)

2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
#
***Ответ***

- Находясь в папке с чартом, устанавливаем его командой ```helm install myapp .```

![1.2.1.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/1.2.1.png?raw=true)

- Проверяем, что все создалось

![1.2.2.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/1.2.2.png?raw=true)

3. В переменных чарта измените образ приложения для изменения версии.
#
***Ответ***

- Пробуем изменить образ приложения, поменяв версию nginx командой ```helm upgrade myapp . --set nginx.image="nginx:1.26.0"```

![1.3.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/1.3.png?raw=true)

------
### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
#
***Ответ***

- Создадим два новых namespace app1 и app2 командами

   ```
   kubectl create namespace app1
   kubectl create namespace app2
   ```

- Запустим несколько копий приложения, изменив namespace и версии приложений командами

   ```
   helm install v1-app1 . --namespace app1 --set nginx.image="nginx:1.25.0" --set redis.image="redis:7.2-alpine"
   helm install v2-app1 . --namespace app1 --set nginx.image="nginx:1.26.0" --set redis.image="redis:7.0-alpine"
   helm install v3-app2 . --namespace app2 --set nginx.image="nginx:latest" --set redis.image="redis:latest"
   ```

2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
#
***Ответ***

- Проверим, что установилось 3 версии приложения

![2.2.1.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/2.2.1.png?raw=true)

- Также проверяем, что все поды и сервисы в статусе Running

![2.2.2.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/2.2.2.png?raw=true)

- И проверим, что в каждом поде версии nginx, указанные при установке

![2.2.3.img](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-10/img/2.2.3.png?raw=true)


3. Продемонстрируйте результат.
#
***Ответ***

Все команды предоставлены на скриншотах выше.

### Правила приёма работы

1. Домашняя работа оформляется в своём Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, `helm`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.