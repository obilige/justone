FROM python:3.9-slim-buster
COPY . /app
WORKDIR /app
RUN python3 -m venv venv && . venv/bin/activate
RUN pip3 install -r requirements.txt
WORKDIR /app/mysite
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
EXPOSE 8000