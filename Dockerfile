FROM python:3.10

RUN pip install uwsgi

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app

COPY . .


RUN pip install gunicorn
RUN python manage.py migrate

ENTRYPOINT [ "gunicorn","--workers=1","-b=0.0.0.0:8000","aiir_course_work.wsgi:application" ]

