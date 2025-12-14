# Домашнее задание к занятию «Запуск приложений в K8S» - Лепишин Алексей

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Deployment с приложением, состоящим из нескольких контейнеров, и масштабировать его.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) Init-контейнеров.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
#
***Ответ:***
#
Создаём манифест [deployment.yaml](https://github.com/Liberaty/k8s_hw_03/blob/main/deployment.yaml)
#

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: multitool
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multitool
  template:
    metadata:
      labels:
        app: multitool
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
      - name: multitool
        image: wbitt/network-multitool:latest
        ports:
        - containerPort: 8080

```
Запускаем манефест командой
```
kubectl apply -f deployment.yaml
```
После чего проверяем выполнения манефеста
```
kubectl get pods -A
kubectl logs pods/multitool-6d7bd49559-6clc4
```

#
![1.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/1.1.png?raw=true)

После изучения понял, что ошибка возникает из-за того что порт 80 порт занят

Далее исправляем манифест

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: multitool
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multitool
  template:
    metadata:
      labels:
        app: multitool
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
      - name: multitool
        image: wbitt/network-multitool:latest
        ports:
        - containerPort: 8080
        env:
        - name: HTTP_PORT
          value: "7080"
```

Перезапускаем и видим результат - под запустился
#
![1.2.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/1.2.png?raw=true)

#

2. После запуска увеличить количество реплик работающего приложения до 2.
#
***Ответ:***
#
Создаём манифест [deployment-replica.yaml](https://github.com/Liberaty/k8s_hw_03/blob/main/deployment-replica.yaml) с изменённым значением в поле **replicas: 2**
#

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: multitool
spec:
  replicas: 2
  selector:
    matchLabels:
      app: multitool
  template:
    metadata:
      labels:
        app: multitool
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
      - name: multitool
        image: wbitt/network-multitool:latest
        ports:
        - containerPort: 8080

```

Получаем результат запущенного пода с двумя репликами
#
![2.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/2.1.png?raw=true)

3. Продемонстрировать количество подов до и после масштабирования.
#
***Ответ:***
#
![1.2.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/1.2.png?raw=true)
#
![2.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/2.1.png?raw=true)

4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
#
***Ответ:***
#
Создаём манифест [service.yaml](https://github.com/Liberaty/k8s_hw_03/blob/main/service.yaml) для сервиса со следующим содержимым

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-multitool-svc
spec:
  selector:
    app: multitool
  ports:
    - protocol: TCP
      name: nginx
      port: 80
      targetPort: 80    
    - protocol: TCP
      name: multitool
      port: 8080
      targetPort: 7080
```

И проверяем:
#
![4.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/4.1.png?raw=true)

5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.
#
***Ответ:***
#
Создаём манифест [multitool-pod.yaml](https://github.com/Liberaty/k8s_hw_03/blob/main/multitool-pod.yaml)
#
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multitool-test
spec:
  containers:
  - name: multitool
    image: wbitt/network-multitool:latest
```

применяем его и проверяем
#
![5.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/5.1.png?raw=true)

------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
#
***Ответ***
#
Создаем манифест [init-deployment.yaml](https://github.com/Liberaty/k8s_hw_03/blob/main/init-deployment.yaml) и применяем его командой ```kubectl apply -f init-deployment.yaml```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-init-deploy
  namespace: netology
spec:
  selector:
    matchLabels:
      app: nginx-init
  replicas: 1
  template:
    metadata:
      labels:
        app: nginx-init
    spec:
      containers:
      - name: nginx
        image: nginx:1.25.4
        ports:
        - containerPort: 80
      initContainers:
      - name: delay
        image: busybox
        command: ['sh', '-c', "until nslookup nginx-init-svc.$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace).svc.cluster.local; do echo waiting for nginx-init-svc; sleep 2; done"]
```

2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
#
***Ответ***
#
Убеждаемся, что контейнер с nginx не стартует (статус Init)
#
![2.2.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/2.2.1.png?raw=true)

3. Создать и запустить Service. Убедиться, что Init запустился.
#
***Ответ***
#
Создаем [init-service.yaml](https://github.com/Liberaty/k8s_hw_03/blob/main/init-service.yaml) c selector ```app: nginx-init``` и запускаем командой ```kubectl apply -f init-service.yaml```

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-init-svc
  namespace: netology
  
spec:
  ports:
    - name: nginx-init
      port: 80
  selector:
    app: nginx-init
```

![2.3.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/2.3.1.png?raw=true)

4. Продемонстрировать состояние пода до и после запуска сервиса.
#
***Ответ***
#
![2.4.1.png](https://github.com/Liberaty/k8s_hw_03/blob/main/img/2.4.1.png?raw=true)


------

### Правила приема работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl` и скриншоты результатов.
3. Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.

------