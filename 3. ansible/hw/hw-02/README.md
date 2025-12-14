# Домашнее задание к занятию 2 «Работа с Playbook»

## Подготовка к выполнению

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

![infrastructure.png](https://github.com/Liberaty/ans_hw_2/blob/main/img/infrastructure.png?raw=true)

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.

***Ответ:***
![2.1.png](https://github.com/Liberaty/ans_hw_2/blob/main/img/2.1.png?raw=true)

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!

***Ответ:*** Вот [тут](https://github.com/Liberaty/ans_hw_2/blob/main/playbook/site.yml) дописанный код с 94 строки.

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.

***Ответ:*** Воспринял это как рекомендации, однако я переписал playbook и в целом сделал его под Ubuntu и сделал его более идемпотентным.

4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.

***Ответ:*** Всё верно, так и есть. Всё описанное тут выполняется.

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

***Ответ:***
![2.5.png](https://github.com/Liberaty/ans_hw_2/blob/main/img/2.5.png?raw=true)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

***Ответ:*** 
[ССылка на результат](https://github.com/Liberaty/ans_hw_2/blob/main/Other/check.md)
![2.6.png](https://github.com/Liberaty/ans_hw_2/blob/main/img/2.6.png?raw=true)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

***Ответ:*** 
[ССылка на результат](https://github.com/Liberaty/ans_hw_2/blob/main/Other/diff-1.md)
![2.7.png](https://github.com/Liberaty/ans_hw_2/blob/main/img/2.7.png?raw=true)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

***Ответ:*** 
[ССылка на результат](https://github.com/Liberaty/ans_hw_2/blob/main/Other/diff-2.md)
![2.8.png](https://github.com/Liberaty/ans_hw_2/blob/main/img/2.8.png?raw=true)

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

***Ответ:***
[ссылка на коммит с тэгом](https://github.com/Liberaty/ans_hw_2/releases/tag/08-ansible-02-playbook)
---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
