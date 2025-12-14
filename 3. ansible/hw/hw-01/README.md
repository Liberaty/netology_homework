# Домашнее задание к занятию 1 «Введение в Ansible» (ans_hw_1)

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
***Ответ:*** 

![ansible.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/ansible.png?raw=true)

2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
***Ответ:***

https://github.com/Liberaty/ans_hw_1

3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

***Ответ:*** 

![tree.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/tree.png)

4. Установите Docker

***Ответ:*** 

![docker.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/docker.png)

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

***Ответ:***

![1.1.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.1.png)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

***Ответ:***
![1.2.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.2.png?raw=true)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

***Ответ:***
![1.3.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.3.png?raw=true)

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

***Ответ:***
![1.4.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.4.png?raw=true)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

***Ответ:***
![1.5.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.5.png?raw=true)

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

***Ответ:***
![1.6.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.6.png?raw=true)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

***Ответ:***
![1.7.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.7.png?raw=true)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

***Ответ:***
![1.8.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.8.png?raw=true)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

***Ответ:*** Выбираем самый первый plugin - ansible.builtin.local

![1.9.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.9.png?raw=true)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

***Ответ:***
![1.10.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.10.png?raw=true)

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

***Ответ:***
![1.11.png](https://github.com/Liberaty/ans_hw_1/blob/main/img/1.11.png?raw=true)

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

***Ответ:*** https://github.com/Liberaty/ans_hw_1/tree/main

13. Предоставьте скриншоты результатов запуска команд.

***Ответ:*** все скриншоты добавлены к своим пунктам.