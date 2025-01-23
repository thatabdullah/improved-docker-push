FROM python

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 5000
EXPOSE 3306

COPY . .

CMD [ "python", "app.py" ]