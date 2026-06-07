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
curl -o ip.sh https://raw.githubusercontent.com/dictovod/VPN/refs/heads/main/ip.sh && bash ip.sh
```
