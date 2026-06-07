# CallMy VPN

## Полезные ссылки

- [Реферальная карта](https://callmy.ru/)
- [Список пакетов вне VPN](https://callmy.ru/pkg/)
- [Создать звонок ВКонтакте](https://callmy.ru/vk/)

## Проверка IP и соединения

### Windows (CMD)

Скачать и запустить скрипт:
```cmd
curl -o ip.bat https://raw.githubusercontent.com/dictovod/VPN/refs/heads/main/ip.bat && ip.bat
```
Спросит интервал в секундах, затем будет выводить текущий IP и время в столбик.

### Android (Termux)

Установить [Termux](https://github.com/termux/termux-app/releases), затем:
```bash
curl -s https://raw.githubusercontent.com/dictovod/VPN/refs/heads/main/ip.sh | tr -d '\r' | bash -s 3
```
```bash
SEC=3; while true; do IP=$(curl -s https://api.ipify.org); echo "$(date '+%Y-%m-%d %H:%M:%S') IP: $IP"; sleep $SEC; done
```
