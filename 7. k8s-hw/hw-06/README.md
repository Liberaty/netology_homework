# Домашнее задание к занятию «Хранение в K8s. Часть 1» - Лепишин Алексей

### Цель задания

В тестовой среде Kubernetes нужно обеспечить обмен файлами между контейнерам пода и доступ к логам ноды.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным GitHub-репозиторием.

------

### Дополнительные материалы для выполнения задания

1. [Инструкция по установке MicroK8S](https://microk8s.io/docs/getting-started).
2. [Описание Volumes](https://kubernetes.io/docs/concepts/storage/volumes/).
3. [Описание Multitool](https://github.com/wbitt/Network-MultiTool).

------

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
#
***Ответ***

Создаём манифест [**deployment.yaml**](https://github.com/Liberaty/k8s_hw_06/blob/main/deployment.yaml) и запускаем его

![1.1.png](https://github.com/Liberaty/k8s_hw_06/blob/main/img/1.1.png?raw=true)

2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
#
***Ответ***

Чтобы контейнер busybox писал дату каждые 5 секунд добавляем в манифест ```command: ["/bin/sh", "-c"]``` и ```args: ["while true; do echo $(date) >> /shared-data/log.txt; sleep 5; done"]```

3. Обеспечить возможность чтения файла контейнером multitool.
#
***Ответ***

Для чтения из контейнера multitool добавляем в манифест ```command: ["/bin/sh", "-c"]``` и ```args: ["tail -f /shared-data/log.txt"]```

4. Продемонстрировать, что multitool может читать файл, который периодически обновляется.
#
***Ответ***

Проверяем, что multitool читает файл, который периодически обновляется командой ```kubectl logs -l app=shared-volume -c multitool```

![1.4.png](https://github.com/Liberaty/k8s_hw_06/blob/main/img/1.4.png?raw=true)

5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Задание 2

**Что нужно сделать**

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
#
***Ответ***

Создаём манифест [**daemonset.yaml**](https://github.com/Liberaty/k8s_hw_06/blob/main/daemonset.yaml), запускаем его и проверяем статус

![2.1.png](https://github.com/Liberaty/k8s_hw_06/blob/main/img/2.1.png?raw=true)

2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
#
***Ответ***

Для этого в манифесте были прописаны следующие строки:
```yaml
        volumeMounts:
        - name: logdir
          mountPath: /nodes-logs/syslog
          subPath: syslog
        - name: varlog
          mountPath: /var/log/syslog
          readOnly: true
      terminationGracePeriodSeconds: 30
      volumes:
      - name: logdir
        hostPath:
          path: /var/log
      - name: varlog
        hostPath:
          path: /var/log
```

3. Продемонстрировать возможность чтения файла изнутри пода.
#
***Ответ***

Для этого подключаюсь к pod с контейнером multitool и читаю файл по пути ***/nodes-logs/syslog***

![2.3.png](https://github.com/Liberaty/k8s_hw_06/blob/main/img/2.3.png?raw=true)

4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.
#
***Ответ***

Все команды предоставлены на скриншоте выше.

------

### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------