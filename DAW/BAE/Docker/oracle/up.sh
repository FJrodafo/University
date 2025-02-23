#!/bin/bash

docker run -d -p 1521:1521 -e ORACLE_PASSWORD=1q2w3e4r --name oracle gvenzl/oracle-xe:18
