#!/bin/bash
cd /home/user/path/to/MySQL_Docker
docker pull mysql
docker pull phpmyadmin/phpmyadmin
docker-compose up -d
