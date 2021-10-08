FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

HEALTHCHECK --interval=1m --timeout=3s --start-period=10s \
  CMD curl --fail http://localhost:5000/health --tries=1 || exit 1  

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

#docker build . -t apipy:latest
#docker run -d -p 5000:5000 apipy
#https://scoutapm.com/blog/how-to-use-docker-healthcheck