FROM python:3.8

WORKDIR /app
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

COPY app /app
COPY requirements.txt /app/requirements.txt
COPY cmd.sh /

RUN pip install -r /app/requirements.txt
RUN chmod +x /cmd.sh

EXPOSE 9090 9191 5000
USER uwsgi

CMD ["/cmd.sh"]
