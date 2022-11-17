#!/bin/bash

rm -r tempdir
mkdir tempdir
mkdir tempdir/static
mkdir tempdir/templates

cp midterm_app.py tempdir/
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates" >> tempdir/Dockerfile
echo "COPY midterm_app.py /home/myapp" >> tempdir/Dockerfile
echo "EXPOSE 8080" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py" >> tempdir/Dockerfile
cd tempdir
docker build -t midterm_app .
docker run -t -d -p 5050:5050 --name midtermrun midterm_app
docker ps -a