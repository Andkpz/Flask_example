# Базовый образ с Python
FROM python:3.11-slim

# Отключаем .pyc и буферизацию логов
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Рабочая директория
WORKDIR /app

# Сначала зависимости (для кеширования)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Копируем код
COPY . .

# Back4App сам прокидывает порт через $PORT
CMD gunicorn app:app --bind 0.0.0.0:$PORT
