## Опис
Це проста програма де відображається час та температура в певному місті

## Використання
Для роботи необхідно `JSON` [парсер](https://github.com/rxi/json.lua). Він повинен зберігатись на одному рівні з файлом `weather.lua` та називатись `json.lua`. Якщо зміните назву - виправте її у файлі `weather.lua` у полі `local json = require("$file_name")`.  
Потрібно зареєструватись та згенерувати API ключ для [OpenWeather](https://home.openweathermap.org/api_keys).  
У файлі `wather.lua` вставити ключ у поле `api_key`.  
У файлі `wather.lua` прописати назву міста у поле `city_name`.  

Скрипт має оновлювати дані щогодини о 00 та 30 хвилин  

![Приклад](./src/weather.png)