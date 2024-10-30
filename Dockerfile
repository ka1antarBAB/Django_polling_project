FROM python:3.12.0-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /polling

# نصب ابزارهای مورد نیاز برای پکیج‌های خاص (در صورت لزوم)
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt /polling/
RUN pip install --no-cache-dir -r requirements.txt


COPY . /polling/
