# VPN
Версия Xray: v25.8.3

Основные пути к конфигурационным файлам сервиса Xray на вашем сервере:

Основной конфигурационный файл:  
`/usr/local/etc/xray/config.json`

Systemd unit-файл сервиса:  
`/etc/systemd/system/xray.service`

Дополнительные дроп-ин файлы systemd для переопределения настроек:  
`/etc/systemd/system/xray.service.d/10-donot_touch_single_conf.conf 
/etc/systemd/system/xray.service.d/override.conf`  

Логи (по умолчанию, если настраивались):  
`/var/log/xray/access.log  
/var/log/xray/error.log`

Возможные альтернативные пути к конфигам (зависит от способа установки):  
`/opt/xray/config.json  
/opt/etc/xray/config.json  
/usr/local/etc/xray/configs/` (папка с дополнительными конфигурациями)

Эти пути покрывают основную структуру настройки и файлов сервиса Xray на Linux-серверах.
