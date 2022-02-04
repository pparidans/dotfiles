# syntax=docker/dockerfile:1
FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y python3 \
        python3-babel \
        python3-chardet \
        python3-dateutil \
        python3-decorator \
        python3-docutils \
        python3-freezegun \
        python3-pil \
        python3-jinja2 \
        python3-libsass \
        python3-lxml \
        python3-num2words \
        python3-ofxparse \
        python3-passlib \
        python3-polib \
        python3-psutil \
        python3-psycopg2 \
        python3-pydot \
        python3-openssl \
        python3-pypdf2 \
        python3-qrcode \
        python3-renderpm \
        python3-reportlab \
        python3-requests \
        python3-stdnum \
        python3-tz \
        python3-vobject \
        python3-werkzeug \
        python3-xlsxwriter \
        python3-xlrd \
        python3-zeep \
        python3-num2words \
        python3-pdfminer \
        python3-pip \
        python3-phonenumbers \
        python3-psycopg2 \
        python3-pyldap \
        python3-qrcode \
        python3-renderpm \
        python3-setuptools \
        python3-slugify \
        python3-vobject \
        python3-watchdog \
        python3-xlrd \
        python3-xlwt \
        wkhtmltopdf \
        python3-html2text

ENV ODOO_RC /app/.odoorc
WORKDIR /app

EXPOSE 8069

#RUN apt-get update && \
#    apt-get install -y --no-install-recommends \
#        ca-certificates \
#        curl \
#        dirmngr \
#        fonts-noto-cjk \
#        gnupg \
#        libssl-dev \
#        node-less \
#        npm \
#        python3-num2words \
#        python3-pdfminer \
#        python3-pip \
#        python3-phonenumbers \
#        python3-psycopg2 \
#        python3-pyldap \
#        python3-qrcode \
#        python3-renderpm \
#        python3-setuptools \
#        python3-slugify \
#        python3-vobject \
#        python3-watchdog \
#        python3-xlrd \
#        python3-xlwt \
#        xz-utils \
#        wkhtmltopdf

