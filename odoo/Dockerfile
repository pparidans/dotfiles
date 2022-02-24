# syntax=docker/dockerfile:1
FROM python:3.9-bullseye

RUN pip install --no-cache-dir --upgrade pip wheel

WORKDIR /src

COPY ./odoo/requirements.txt ./
RUN apt-get update && apt-get install -y libldap2-dev libsasl2-dev wkhtmltopdf postgresql-client chromium
RUN pip install --no-cache-dir -r requirements.txt inotify pudb websocket-client

EXPOSE 8069

ENTRYPOINT ["python", "odoo/odoo-bin", "--data-dir", "/var/lib/odoo", "--db_host", "/var/run/postgresql", "--dev", "xml,qweb,reload"]

