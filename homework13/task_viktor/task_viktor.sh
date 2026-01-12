/   #!/bin/bash
: << "DOC"
Linux: Домашнее задание 13 (Python)
- Создайте папку со своим именем в на сервере linux.itcareerhub.de. 
В папке с Вашим именем создайте скрипт task_NAME.sh, где NAME - Ваше имя.
- Скрипт должен создавать по 10 файлов с порядковым номером и датой создания. 
1_20.04.23 , 2_20.04.23 , 3_20.04.23 .. 10_20.04.23
- Создайте в планировщике новое задание, которое должно будет запускать Ваш скрипт каждые 15 минут.
- Создайте архив с файлами из п2. , добавьте в него историю команд, которую вы выполнили. 
- Закомментируйте строку с заданием в планировщике 
(добавьте # в начало строки с вашим заданием), чтобы выключить задание, но оставить его “в быстром доступе”

Что пригодится:
date +"%d.%m.%y"
touch
export EDITOR=nano
crontab -l
crontab -e
Crontab.guru
Однострочник, создающий простейший скрипт в /tmp , который надо будет редактировать дальше:
echo -e `#!/bin/bash\n date\n echo “it works!“` > /tmp/script.sh
echo -e '#!/bin/bash\ndate\necho "it works!"' > /tmp/script.sh

DOC

cd /opt/101025-ptm/viktorplus/task_viktor
for i in {1..10}
do
touch "${i}_$(date +"%d.%m.%y")"
done
# если  бы команды были в скрипте то можно так:
# history | tail -n 15 > history.txt
# tar -czf archiv_$(date +"%d.%m.%y").tar.gz *_$(date +"%d.%m.%y") history.txt
# tar -czf archive.tar.gz --exclude='*.sh' .
# echo "*/15 * * * * /opt/101025-ptm/viktorplus/task_viktor/task_viktor.sh" | crontab -
