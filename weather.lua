local json = require("JSON")
local api_key = "$API_KEY"
local city_name = "Brovary,UA"
local api_endpoint = "https://api.openweathermap.org/data/2.5/weather?q=" .. city_name .. "&appid=" .. api_key .. "&units=metric"
local request = {url = api_endpoint,method = "GET"}
local date = "00-00-0000"
local time = "00:00"
local temperature = "0"
local temp_max = "0"
local temp_min = "0"
local conditions = "0"
local feels_like = "0"
local wind_speed = "0"

function lilka.update(delta)
    date = os.date("%d-%m-%Y")
    time = os.date("%H:%M:%S")

    if controller.get_state().b.just_pressed then
        util.exit()
    end
end

local response = http.execute(request)
if response and response.code == 200 then
  print("Weather data received")
else
  print("Error fetching weather data: " .. (response and response.code or "No response"))
end

function get_data()
    if response and response.response then
    local status, weather_data = pcall(json.decode, response.response)
    temperature = weather_data.main.temp
    feels_like = weather_data.main.feels_like
    temp_max = weather_data.main.temp_max
    temp_min = weather_data.main.temp_min
    wind_speed = weather_data.wind.speed
    conditions = weather_data.weather[1].description
    print("Temperature: " .. temperature .. "°C")
    print("Conditions: " .. conditions)
    print("T. max: " .. temp_max)
    print("T. min: " .. temp_min)
    end
end
local current_time = os.date("%Y-%m-%d %H:%M:%S")
print("Current Date and Time: " .. current_time)

get_data()
function lilka.draw()
    -- Reset display
    display.set_font("10x20")
    display.fill_screen(display.color565(0, 0, 0))
    display.set_cursor(15, 30)
    display.print("Погода " .. city_name)
    display.set_cursor(15, 55)
    display.print("Дата: " .. date)
    display.set_cursor(15, 75)
    display.print("Час: " .. time)
    display.set_cursor(15, 100)
    display.print("Температура: " .. temperature, "°C")
    display.set_cursor(15, 120)
    display.print("Погода: " .. conditions)
    display.set_cursor(15, 140)
    display.print("Швидкість вітру: " .. wind_speed)
    display.set_cursor(15, 165)
    display.print("Відчувається як: " .. feels_like, "°C")
    display.set_cursor(15, 185)
    display.print("Макс. температура: " .. temp_max)
    display.set_cursor(15, 205)
    display.print("Мін. температура: " .. temp_min)
    if os.date("*t").min == 0 or os.date("*t").min == 30 and current_time.sec == 0 then
        get_data()
    end
end