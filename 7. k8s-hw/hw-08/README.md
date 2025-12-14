# Домашнее задание к занятию «Конфигурация приложений» - Лепишин Алексей

### Цель задания

В тестовой среде Kubernetes необходимо создать конфигурацию и продемонстрировать работу приложения.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8s).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым GitHub-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/configuration/secret/) Secret.
2. [Описание](https://kubernetes.io/docs/concepts/configuration/configmap/) ConfigMap.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
#
***Ответ***

Создаем [**deployment.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/deployment.yaml) состоящего из двух контейнеров.

2. Решить возникшую проблему с помощью ConfigMap.
#
***Ответ***

Проблема возникает потому, что оба контейнера по умолчанию пытаются слушать порт 80.

Решаем её созданием [**multitool-config.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/multitool-config.yaml), где добавим ключ:значение ```HTTP_PORT: "8080"``` и передадим ее через переменную ```env``` в deployment и заменим в контейнере multitool порт c 80 на 8080.

3. Продемонстрировать, что pod стартовал и оба конейнера работают.
#
***Ответ***

Сначала запускаем ConfigMap'с, так как pod выпадет в ошибку, если не будет этих переменных.

![1.3.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/1.3.1.png?raw=true)

Далее запускаем deployment и проверяем его статус

![1.3.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/1.3.2.png?raw=true)

4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.
#
***Ответ***

Заранее создал страницу через ConfigMap [**nginx-html.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/nginx-html.yaml)

подключаем ее через volume в Deployment и добавляем ее по пути mountPath: */usr/share/nginx/html* в контейнер nginx

Подключаем [**service.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/service.yaml) и проверяем с помощью curl

![1.4.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/1.4.png?raw=true)

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.
#
***Ответ***

Создаём манифет [**deployment-https.yaml**](https://github.com/Liberaty/k8s_hw_08/blob/main/deployment-https.yaml)

2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
#
***Ответ***

Используем [**nginx-html.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/nginx-html.yaml), которую создал для прошлого задания.

Подключаем ее к Deployment через volume

![2.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/2.2.png?raw=true)

3. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.
#
***Ответ***

Генерируем самоподписной сертификат SSL командой ```openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=my-nginx/O=netology"``` и создаем Secret для его использования

Перекодируем оба файла в base64 и добавляем их в [**secret-ssl.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/secret-ssl.yaml-exampl)

![2.3.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/2.3.1.png?raw=true)

Создаём манифест [**nginx-conf.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/nginx-conf.yaml)

![2.3.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/2.3.2.png?raw=true)

Только потом запускаем [**deployment-https.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/deployment-https.yaml) и проверяем статус

![2.3.3.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/2.3.3.png?raw=true)

4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS. 
#
***Ответ***

Создаём манифесты [**service-https.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/service-https.yaml) и [**ingress.yaml**](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/ingress.yaml), запускаем и проверяем статус

![2.4.1.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/2.4.1.png?raw=true)

Теперь проверяем с помощью curl, что страница доступна через https

![2.4.2.png](https://github.com/Liberaty/netology_homework/blob/main/7.%20k8s-hw/hw-08/img/2.4.2.png?raw=true)

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Правила приёма работы

1. Домашняя работа оформляется в своём GitHub-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------