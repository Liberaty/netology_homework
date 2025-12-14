# Домашнее задание к занятию «Безопасность в облачных провайдерах»  - Лепишин Алексей

Используя конфигурации, выполненные в рамках предыдущих домашних заданий, нужно добавить возможность шифрования бакета.

---
## Задание 1. Yandex Cloud   

1. С помощью ключа в KMS необходимо зашифровать содержимое бакета:

 - создать ключ в KMS;
 - с помощью ключа зашифровать содержимое бакета, созданного ранее.
2. (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:

 - создать сертификат;
 - создать статическую страницу в Object Storage и применить сертификат HTTPS;
 - в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).

Полезные документы:

- [Настройка HTTPS статичного сайта](https://cloud.yandex.ru/docs/storage/operations/hosting/certificate).
- [Object Storage bucket](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/storage_bucket).
- [KMS key](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kms_symmetric_key).

--- 

## Решение

1. В [**main.tf**](https://github.com/Liberaty/rp_hw_03/blob/main/main.tf) создаем kms ключ и шифруем им s3-bucket.

   - Проверяем, что ключ создался:

   ![1.1.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/1.1.png?raw=true)

   - Файл зашифрован:

   ![1.2.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/1.2.png?raw=true)

   - Теперь при попытке открыть файл по ссылке, получаем ошибку **AccessDenied**:

   ![1.3.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/1.3.png?raw=true)

   - Однако можно сгенерировать ссылку и файл по ней будет доступен:

   ![1.4.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/1.4.png?raw=true)

2. Создаём отдельный статический сайт в Object Storage c собственным публичным адресом с уже имеющимся доменом и делаем его доступным по HTTPS.

   - Добавляем сгенерированный сертификат:

   ![2.1.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/2.1.png?raw=true)

   - Создаем страницу и добавляем ее в бакет:

   ![2.2.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/2.2.png?raw=true)

   - В настройках бакета выбираем веб-сайт и указываем загруженную страницу:

   ![2.3.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/2.3.png?raw=true)

   - В настройках бакета уже выбран сертификат:

   ![2.4.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/2.4.png?raw=true)

   - Заходим на страницу (в моём случае на https://snakenet.ru) и видим, что сама страница отображается и что подключение защищено:

   ![2.5.png](https://github.com/Liberaty/rp_hw_03/blob/main/img/2.5.png?raw=true)


Пример bootstrap-скрипта:

```
#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><h1>My cool web-server</h1></html>" > index.html
aws s3 mb s3://mysuperbacketname2021
aws s3 cp index.html s3://mysuperbacketname2021
```

### Правила приёма работы

Домашняя работа оформляется в своём Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.