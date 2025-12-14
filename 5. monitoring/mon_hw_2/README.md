# Домашнее задание к занятию 14 «Средство визуализации Grafana»

## Задание повышенной сложности

**При решении задания 1** не используйте директорию [help](./help) для сборки проекта. Самостоятельно разверните grafana, где в роли источника данных будет выступать prometheus, а сборщиком данных будет node-exporter:

- grafana;
- prometheus-server;
- prometheus node-exporter.

За дополнительными материалами можете обратиться в официальную документацию grafana и prometheus.

В решении к домашнему заданию также приведите все конфигурации, скрипты, манифесты, которые вы 
использовали в процессе решения задания.

**При решении задания 3** вы должны самостоятельно завести удобный для вас канал нотификации, например, Telegram или email, и отправить туда тестовые события.

В решении приведите скриншоты тестовых событий из каналов нотификаций.

## Обязательные задания

### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
#
***Ответ***
Поднял всё это исключительно с помощью [Terraform](https://github.com/Liberaty/mon_hw_2/tree/main/terraform) и [Ansible](https://github.com/Liberaty/mon_hw_2/tree/main/ansible)
#
![1.1.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/1.1.png?raw=true)
#
2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
#
***Ответ***
#
![1.2.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/1.2.png?raw=true)
#
3. Подключите поднятый вами prometheus, как источник данных.
#
***Ответ***
#
![1.3.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/1.3.png?raw=true)
#
4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.
#
***Ответ***
#
![1.4.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/1.4.png?raw=true)
#

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
2. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
3. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.
#
***Ответ***
#
PromQL-запросы:
#
CPU Utilization (%) - "100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100)"
#
CPU Load Average 1min - "node_load1"
#
CPU Load Average 5min - "node_load5"
#
CPU Load Average 15min - "node_load15"
#
Free Memory (MB) - "node_memory_MemFree_bytes / 1024 / 1024"
#
Free Disk Space (GB) - "node_filesystem_avail_bytes{mountpoint="/"}"
#
![2.2.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/2.2.png?raw=true)
#
## Задание 3
#
1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
#
***Ответ***

![3.1.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/3.1.png?raw=true)

![3.2.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/3.2.png?raw=true)
#
2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.
#
***Ответ***
![3.3.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/3.3.png?raw=true)
#
## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
#
***Ответ***
![4.1.png](https://github.com/Liberaty/mon_hw_2/blob/main/img/4.1.png?raw=true)
#
2. В качестве решения задания приведите листинг этого файла.
#
***Ответ***
[Показатели системы.json](https://github.com/Liberaty/mon_hw_2/blob/main/Показатели%20системы.json)
#
---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---