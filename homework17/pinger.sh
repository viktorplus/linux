#!/bin/bash

address=$1
if (( ${#address} == 0 )); then
  read -p "Введите адрес сервера для пинга: " address
fi

fails=0

while true; do
  ping_result=$(ping -c 1 "$address" 2>/dev/null)

  if (( $? != 0 )); then
    ((fails++))
    if (( fails >= 3 )); then
      echo "$(date '+%F %T')  Пинг не удаётся уже $fails раза подряд. [$address]"
    fi
  else
    fails=0

    rtt=$(echo "$ping_result" | grep 'time=' | head -n 1 | sed 's/.*time=//' | sed 's/ ms.*//')
    rtt_int=$(echo "$rtt" | sed 's/\..*//')

    if (( ${#rtt_int} > 0 && rtt_int > 100 )); then
      echo "$(date '+%F %T')  Длинный пинг: $rtt ms (>100). [$address]"
    fi
  fi

  sleep 1
done
