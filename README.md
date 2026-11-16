# CallMy VPN

> ## ➡ Приложение переехало: [github.com/dictovod/CallMy](https://github.com/dictovod/CallMy/releases/latest)
>
> Актуальная версия CallMy для Android и Windows теперь выходит только в репозитории
> **[dictovod/CallMy](https://github.com/dictovod/CallMy)**. Там же Windows-версия.
> Старые релизы 1.4.x ниже больше не обновляются — скачайте новую версию:
> **[⬇ Скачать последнюю версию CallMy](https://github.com/dictovod/CallMy/releases/latest)**
> · Google Play: [CallMy VPN](https://play.google.com/store/apps/details?id=ru.callmy.qwdtt)

Здесь остаются политика конфиденциальности ([PRIVACY.md](PRIVACY.md)) и условия использования ([TERMS.md](TERMS.md)).

## Скачать приложение

- [Последний релиз CallMy](https://github.com/dictovod/CallMy/releases/latest)
- [Связь с разработчиком и поддержка: Telegram @lp85d](https://t.me/lp85d)

## Полезные ссылки

- [Реферальная программа](https://2.27.206.28/)
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
