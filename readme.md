# Dockerizing Flask App and connecting MySQL server

### App description

This is `Flask` based Blog app with `MySQL` (ORM) at backend. It has four sections:

1. Posts Page:
   Global users who visit website can see the posts uploaded by admin. Pagination is implemented at backend.

2. Contact Page
   If they want to contact admin, they can fill the contact form which asks there name, contact no., email, and any message they want to deliver.

3. About Page
   Here admin can write introductory information of his Blog website, his purpose, and any information he wants to deliver to his readers.

4. Dashboard (For Admin only)
   Admin (website owner) has to login via credentials. And then he can create, delete, and update posts. 


### Quick Start (Running in docker)
```bash
# clone the repo and enter the project directory
git clone https://github.com/Saweiz/Dockerize-Flask-App
cd Flask-Blog-App
```

```bash
# build docker image
docker build -t flask_blog_app:v1 .
```

```bash
# run the docker container
docker run --name blog_app -d flask_blog_app:v1
```

```bash
# see the logs for app continously
docker logs blog_app --follow
```

The app would be running at listed ip on port 5000. 





### Quick Start (Running the app locally)
```bash
# clone the repo and enter the project directory
git clone https://github.com/Saweiz/Dockerize-Flask-App
cd Flask-Blog-App
```
```bash
# create virtual environment and activate it
python3 -m venv venv
source venv/bin/activate
```
```bash
# install necessary python modules within virtual environment
pip install flask flask-sqlalchemy pymysql

```
```bash
# run the app
pyhton3 wsgi.py
```

