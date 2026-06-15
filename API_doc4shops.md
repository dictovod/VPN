# CallMy VPN API

Base URL: `https://callmy.ru/wp-json/vpn/v1`  
Auth: все запросы требуют `api_key` (выдаётся в панели CallMy VPN → Магазины)  
Content-Type: `application/json`

---

## POST /activate

Активирует (продлевает) подписку после оплаты.

**Запрос**
```json
{
  "api_key":  "shop_xxx",
  "aid":      "a1b2c3d4e5f6a7",
  "days":     30,
  "order_id": "PAY-001",
  "amount":   299.00,
  "note":     "опционально"
}
```

**Ответ 200**
```json
{
  "ok":           true,
  "aid":          "a1b2c3d4e5f6a7",
  "days":         30,
  "bonus_days":   3,
  "active_until": "2024-07-14 12:00:00",
  "order_id":     "PAY-001",
  "shop":         "pay.callmy.ru"
}
```

Идемпотентен по `order_id` — повторный запрос вернёт `{"ok":true,"note":"already processed"}`.

---

## POST /deactivate

Отменяет подписку и откатывает дни (возврат средств).  
Магазин может отменить только свои платежи.

**Запрос**
```json
{
  "api_key":  "shop_xxx",
  "order_id": "PAY-001",
  "reason":   "опционально"
}
```
Вместо `order_id` можно передать `aid` — тогда отменяется последний платёж этого устройства от данного магазина.

**Ответ 200**
```json
{
  "ok":               true,
  "aid":              "a1b2c3d4e5f6a7",
  "order_id":         "PAY-001",
  "days_removed":     30,
  "new_active_until": "2024-06-14 12:00:00",
  "shop":             "pay.callmy.ru"
}
```

Бонусные дни реферера откатываются автоматически.

---

## POST /profiles

Пакетная проверка статусов и истории платежей. Максимум 100 AID за запрос.

**Запрос**
```json
{
  "api_key": "shop_xxx",
  "aids":    ["a1b2c3d4e5f6a7", "b2c3d4e5f6a7b1"]
}
```

**Ответ 200**
```json
{
  "ok":    true,
  "shop":  "pay.callmy.ru",
  "total": 2,
  "found": 2,
  "profiles": [
    {
      "aid":               "a1b2c3d4e5f6a7",
      "found":             true,
      "status":            "active",
      "active_until":      "2024-07-14 12:00:00",
      "expired":           false,
      "days_left":         30,
      "device":            "Samsung Galaxy S21",
      "android_ver":       "13",
      "registered_at":     "2024-06-01 10:00:00",
      "last_seen_at":      "2024-06-14 08:30:00",
      "referrer_aid":      "ref123",
      "shop_payments":     2,
      "shop_amount":       598.00,
      "shop_days_total":   60,
      "shop_refunds":      0,
      "shop_last_payment": "2024-06-14 12:00:00"
    },
    {
      "aid":   "b2c3d4e5f6a7b1",
      "found": false
    }
  ]
}
```

`shop_*` — только платежи от вашего магазина.

---

## Ошибки

| HTTP | code                | Причина |
|------|---------------------|---------|
| 401  | `missing_api_key`   | Не передан `api_key` |
| 403  | `invalid_api_key`   | Неверный или отключённый ключ |
| 403  | `forbidden`         | Платёж принадлежит другому магазину |
| 400  | `bad_request`       | Отсутствует обязательный параметр |
| 404  | `not_found`         | Устройство или платёж не найдены |

```json
{ "code": "invalid_api_key", "message": "Invalid or inactive api_key", "data": { "status": 403 } }
```

---

## AID

Уникальный идентификатор устройства пользователя (14 hex символов).  
Пользователь видит его в приложении CallMy в разделе «Профиль».  
Магазин получает AID от пользователя при оформлении заказа.
