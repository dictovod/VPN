# CallMy VPN

Публичный репозиторий содержит только готовые APK-релизы CallMy VPN для Android. Исходный код не публикуется.

## Скачать приложение

- [Последний релиз CallMy VPN](https://github.com/dictovod/VPN/releases/latest)
- [Связь с разработчиком и поддержка: Telegram @lp85d](https://t.me/lp85d)

## Полезные ссылки

- [Реферальная карта](https://callmy.ru/)
- [Список пакетов вне VPN](https://callmy.ru/pkg/)
- [Создать звонок ВКонтакте](https://callmy.ru/vk/)

## Проверка IP и соединения

### Windows PowerShell

Интервал проверки задаётся в переменной `$sec`:

```powershell
$sec=10; while ($true) { $ip=(Invoke-RestMethod -Uri "https://api.ipify.org").Trim(); "{0} IP: {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"),$ip; Start-Sleep -Seconds $sec }
```

### Android (Termux)

Установить [Termux](https://github.com/termux/termux-app/releases), затем выполнить:

```bash
SEC=10; while true; do IP=$(curl -s https://api.ipify.org); echo "$(date '+%Y-%m-%d %H:%M:%S') IP: $IP"; sleep $SEC; done
```
