#!/bin/bash

# Определение переменных
REPO_URL="https://github.com/Liberaty/edu_netology-5.git" 		# Замените на URL вашего форка
PROJECT_DIR="/home/$USER/opt/netology-5"                               	# Более безопасный путь
SECRETS_DIR="/home/$USER/secrets"         	                        # Директория с секретами
ENV_FILE="$SECRETS_DIR/.env"                                        	# Путь к файлу .env
YC_TOKEN_FILE="$SECRETS_DIR/yc_token"                               	# Файл с токеном Yandex Cloud

# Убедимся, что директория secrets существует
if [ ! -d "$SECRETS_DIR" ]; then
    echo "Ошибка: Директория с секретами ($SECRETS_DIR) не найдена!"
    exit 1
fi

# Убедимся, что файл .env существует
if [ ! -f "$ENV_FILE" ]; then
    echo "Ошибка: Файл .env ($ENV_FILE) не найден!"
    exit 1
fi

# Убедимся, что файл yc_token существует
if [ ! -f "$YC_TOKEN_FILE" ]; then
    echo "Ошибка: Файл yc_token ($YC_TOKEN_FILE) не найден!"
    exit 1
fi

# Проверка прав доступа к файлу .env
if [ ! -r "$ENV_FILE" ]; then
    echo "Ошибка: Файл .env не имеет прав на чтение!"
    exit 1
fi

# Удаление старой версии проекта (если существует)
if [ -d "$PROJECT_DIR" ]; then
    echo "Удаляем старую версию проекта..."
    rm -rf "$PROJECT_DIR"
fi

# Клонирование репозитория
echo "Клонируем репозиторий..."
git clone "$REPO_URL" "$PROJECT_DIR"

# Переход в директорию проекта
cd "$PROJECT_DIR" || { echo "Не удалось перейти в директорию проекта"; exit 1; }

# Проверка наличия compose.yaml
if [ ! -f "compose.yaml" ]; then
    echo "Ошибка: файл compose.yaml не найден!"
    exit 1
fi

# Копирование файла .env в директорию проекта
echo "Копируем файл .env в директорию проекта..."
cp "$ENV_FILE" "$PROJECT_DIR/.env"

# Проверка успешности копирования
if [ ! -f "$PROJECT_DIR/.env" ]; then
    echo "Ошибка: Файл .env не был скопирован в директорию проекта!"
    exit 1
fi

# Авторизация в Yandex Cloud Container Registry
echo "Авторизуемся в Yandex Cloud Container Registry..."
docker login --username iam --password-stdin https://cr.yandex < "$YC_TOKEN_FILE"

# Проверка успешности авторизации
if [ $? -ne 0 ]; then
    echo "Ошибка: Не удалось авторизоваться в Yandex Cloud Container Registry!"
    exit 1
fi

echo "Успешно авторизовались в Yandex Cloud Container Registry."

# Запуск проекта через docker compose
echo "Запускаем проект..."
docker compose up -d

# Проверка статуса контейнеров
echo "Статус контейнеров:"
docker compose ps
