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
docker run --name blog_app -p 5000:5000 -d flask_blog_app:v1
```
```bash
# see the logs for app continously
docker logs blog_app --follow
```

The app would be running on localhost at port 5000. 





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

### Accessing MySQL server and creating DATABASE and TABLES
Say, MySQL server credentials and params are,<br>
username = admin <br>
password = my_sql_passwd <br>
host = 172.17.0.2 <br>
port = 3306 <br>
database_name = blog_app_db <br>
<br>

Now to create database and tables, get into the MySQL server via MySQL Client,
```bash
# install MySQL Client
sudo apt install mysql-client
```
```bash
# access MySQL server
mysql -u admin -p --host 172.17.0.2 --protocol tcp
```
After entering password, run following SQL commands,
```sql
CREATE DATABASE blog_app_db;
USE blog_app_db;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
 
# contacts table
CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
# posts table
CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
ALTER TABLE `contacts` ADD PRIMARY KEY (`sno`);
 
ALTER TABLE `posts` ADD PRIMARY KEY (`sno`);
 
ALTER TABLE `contacts` MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
 
ALTER TABLE `posts` MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9; COMMIT;
```

### Connecting Database with Flask App
You need to edit config.json for this,
```json
...
...
"local_uri": "mysql://username:password@host:port/database_name",
"prod_uri": "mysql://username:password@host:port/database_name",
...
...
```

referring to the supposed credentials and params in previous section, `"local_uri"` in `config.json` would be:
```json
"local_uri": "mysql://admin:my_sql_passwd@172.17.0.2:3306/blog_app_db",
```
Note: In case of RDS, <b>host = database endpoint<b>.
