#!/bin/sh

count=0
flag=0
while [ 0 -eq 0 ]
do
    echo ".................. job begin  ..................."
    mysql -u {{ .Values.storage.mysql.username }} -h {{ .Values.storage.mysql.host }} -p{{ .Values.storage.mysql.password }} < nacos-mysql.sql

    if [ flag -eq 0 ]; then
        echo "--------------- job complete ---------------"
        break;
    else 
        count=$[${count}+1]
        if [ ${count} -eq 6 ]; then
            echo 'timeout,exit.'
            break
        fi
        echo "...............retry in 30 seconds .........."
        sleep 30
    fi
done