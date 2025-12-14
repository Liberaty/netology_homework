# Домашнее задание к занятию 7 «Жизненный цикл ПО»

## Подготовка к выполнению

1. Получить бесплатную версию Jira - https://www.atlassian.com/ru/software/jira/work-management/free (скопируйте ссылку в адресную строку). Вы можете воспользоваться любым(в том числе бесплатным vpn сервисом) если сайт у вас недоступен. Кроме того вы можете скачать [docker образ](https://hub.docker.com/r/atlassian/jira-software/#) и запустить на своем хосте self-managed версию jira.
2. Настроить её для своей команды разработки.
3. Создать доски Kanban и Scrum.
4. [Дополнительные инструкции от разработчика Jira](https://support.atlassian.com/jira-cloud-administration/docs/import-and-export-issue-workflows/).

## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

***Ответ:***

![workflow_bugs](https://github.com/Liberaty/conf_hw_1/blob/main/img/workflow_1.png?raw=true)

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

***Ответ:***

![workflow_another](https://github.com/Liberaty/conf_hw_1/blob/main/img/workflow_2.png?raw=true)

![workflow_on_kanban](https://github.com/Liberaty/conf_hw_1/blob/main/img/workflow_3.png?raw=true)

**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.

***Ответ:***

![1.1.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.1.png?raw=true)

2. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.

***Ответ:***

![1.2.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.2.png?raw=true)

3. При проведении обеих задач по статусам используйте kanban. 
4. Верните задачи в статус Open.

***Ответ:***

![1.4.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.4.png?raw=true)

5. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.

***Ответ:***

![1.5.1.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.5.1.png?raw=true)

![1.5.2.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.5.2.png?raw=true)

![1.5.3.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.5.3.png?raw=true)

![1.5.4.png](https://github.com/Liberaty/conf_hw_1/blob/main/img/1.5.4.png?raw=true)

6. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

***Ответ:*** [workflow_bugs](https://github.com/Liberaty/conf_hw_1/blob/main/xml/Bugs.xml) и [workflow_another](https://github.com/Liberaty/conf_hw_1/blob/main/xml/Another.xml)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---