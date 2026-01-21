#!/bin/bash
#
#read -p "Введите адрес сервера для пинга: " address
#read -p "Введите количество запросов: " count
address=$1
count=$2
if [ -z "$address" ] || [ -z "$count" ]
  then
  echo "Использование: $0 < IP address или Domain name > <количество запросов>"
  exit 1
fi
 
ping_result=$(ping -c $count $address)
avg_ping=$(echo "$ping_result" | awk -F"/" '/^rtt/ {print $5}')
echo "Среднее время пинга = $avg_ping ms."
