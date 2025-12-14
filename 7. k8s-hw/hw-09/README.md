# Домашнее задание к занятию «Управление доступом» - Лепишин Алексей

### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.
#
***Ответ***

- Создаем ключ для пользователя командой ```openssl genrsa -out alepishin.key 2048```
- Создаем CSR (Certificate Signing Request) командой ```openssl req -new -key alepishin.key -out alepishin.csr -subj "/CN=alepishin/O=netology"```
- Подписываем CSR командой ```openssl x509 -req -in alepishin.csr -CA /var/snap/microk8s/current/certs/ca.crt -CAkey /var/snap/microk8s/current/certs/ca.key -CAcreateserial -out alepishin.crt -days 365```
- Консоль возвращает успешное выполнение выпуска подписанного сертификата
![1.1.img](https://github.com/Liberaty/k8s_hw_09/blob/main/img/1.1.png?raw=true)

2. Настройте конфигурационный файл kubectl для подключения.
#
***Ответ***

- Добавляем пользователя в конфиг kubectl командой ```kubectl config set-credentials alepishin --client-certificate=alepishin.crt --client-key=alepishin.key```
![2.1.img](https://github.com/Liberaty/k8s_hw_09/blob/main/img/2.1.png?raw=true)

- Добавляем контекст командой ```kubectl config set-context alepishin-context --cluster=microk8s-cluster --user=alepishin```
![2.2.img](https://github.com/Liberaty/k8s_hw_09/blob/main/img/2.2.png?raw=true)

- Проверяем командой ```kubectl --context=alepishin-context get pods```, что контекст создан, но получаем ошибку доступа, т.к. RBAC еще не настроен:
![2.3.img](https://github.com/Liberaty/k8s_hw_09/blob/main/img/2.3.png?raw=true)

3. Создайте роли и все необходимые настройки для пользователя.
#
***Ответ***

- Создаем [*role.yaml*](https://github.com/Liberaty/k8s_hw_09/blob/main/role.yaml) и [*rolebinding.yaml*](https://github.com/Liberaty/k8s_hw_09/blob/main/rolebinding.yaml) для пользователя и применяем их.

![3.1.img](https://github.com/Liberaty/k8s_hw_09/blob/main/img/3.1.png?raw=true)

4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).
#
***Ответ***

Проверяем что под пользователем мы можем просматривать поды, читать их логи и описание, но, например, при запросе информации о нодах уже получим ошибку доступа

![4.1.img](https://github.com/Liberaty/k8s_hw_09/blob/main/img/4.1.png?raw=true)

5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.
#
***Ответ***

Все команды предоставлены на скриншотах выше.