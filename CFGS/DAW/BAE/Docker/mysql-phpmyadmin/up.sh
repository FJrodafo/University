#!/bin/bash

docker-compose -f $HOME/Documents/Repos/University/CFGS/DAW/BAE/Docker/docker-compose.yaml up -d

echo -e '\nOpen phpMyAdmin --> \033[1mhttp://localhost:8000\033[0m\n'
echo -e 'Server: \033[1mmysqldb\033[0m'
echo -e 'Username: \033[1mroot\033[0m'
echo -e 'Password: \033[1m1q2w3e4r\033[0m'
