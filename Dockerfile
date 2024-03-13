FROM python:3-alpine

RUN pip3 install flask flask-sqlalchemy pymysql

WORKDIR /app

COPY . .

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
