# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.

***Ответ:***

![0.1.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.1.png?raw=true)

2. Дождитесь запуска teamcity, выполните первоначальную настройку.

***Ответ:***

![0.2.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.2.png?raw=true)

3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.

***Ответ:***

![0.3.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.3.png?raw=true)

4. Авторизуйте агент.

***Ответ:***

![0.4.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.4.png?raw=true)

5. Сделайте fork [**репозитория**](https://github.com/aragastmatb/example-teamcity).

***Ответ:***

![0.5.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.5.png?raw=true)

6. Создайте VM (2CPU4RAM) и запустите [**playbook**](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/terraform/infrastructure/site.yml).

***Ответ:***

![0.6.1.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.6.1.png?raw=true)

![0.6.2.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/0.6.2.png?raw=true)

## Основная часть

1. Создайте новый проект в teamcity на основе fork.

***Ответ:***

![1.1.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.1.png?raw=true)

2. Сделайте autodetect конфигурации.

***Ответ:***

![1.2.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.2.png?raw=true)

3. Сохраните необходимые шаги, запустите первую сборку master.

***Ответ:***

![1.3.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.3.png?raw=true)

4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.

***Ответ:***

![1.4.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.4.png?raw=true)

5. Для deploy будет необходимо загрузить [**settings.xml**](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.

***Ответ:***

![1.5.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.5.png?raw=true)

6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.

***Ответ:***

![1.6.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.6.png?raw=true)

7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.

***Ответ:***

![1.7.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.7.png?raw=true)

8. Мигрируйте `build configuration` в репозиторий.

***Ответ:***

![1.8.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.8.png?raw=true)

9. Создайте отдельную ветку `feature/add_reply` в репозитории.

***Ответ:***

![1.9.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.9.png?raw=true)

10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.

***Ответ:***

![1.10.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.10.png?raw=true)

11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.

***Ответ:***

![1.11.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.11.png?raw=true)

12. Сделайте push всех изменений в новую ветку репозитория.

***Ответ:***

![1.12.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.12.png?raw=true)

13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.

***Ответ:***

![1.13.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.13.png?raw=true)

14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.

***Ответ:***

![1.15.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.15.png?raw=true)

16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
17. Проведите повторную сборку мастера, убедитесь, что сборка прошла успешно и артефакты собраны.

***Ответ:***

![1.17.png](https://github.com/Liberaty/netology_homework/blob/main/4.%20conf-CI-CD/conf_hw_5/img/1.17.png?raw=true)

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
19. В ответе пришлите ссылку на репозиторий.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.