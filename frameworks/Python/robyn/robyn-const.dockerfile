FROM python:3.12

ADD ./ /robyn

WORKDIR /robyn

RUN pip3 install -r /robyn/requirements-const.txt

EXPOSE 8080

CMD ["python", "app-const.py", "--log-level", "warn"]
