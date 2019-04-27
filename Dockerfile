FROM python:3

RUN pip install flask && mkdir /app

WORKDIR /app

COPY hello.html /app/hello.html
COPY zadanko.py /app/zadanko.py

EXPOSE 5000

CMD python zadanko.py --host=0.0.0.0