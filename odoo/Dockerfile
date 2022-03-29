# syntax=docker/dockerfile:1
FROM python:3.9-bullseye

RUN pip install --no-cache-dir --upgrade pip wheel

WORKDIR /src

COPY ./odoo/requirements.txt ./
RUN apt-get update && apt-get install -y libpq-dev libldap2-dev libsasl2-dev postgresql-client wkhtmltopdf chromium nodejs npm
RUN pip install --no-cache-dir -r requirements.txt inotify websocket-client
RUN npm install --global es-check

EXPOSE 8069

ENTRYPOINT ["python", "odoo/odoo-bin", "--data-dir", "/var/lib/odoo", "--db_host", "/var/run/postgresql", "--dev", "xml,qweb,reload"]

