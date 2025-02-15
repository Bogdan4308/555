#include <WiFi.h>
#include <ESPAsyncWebServer.h>
#include <FastLED.h>
#include <SPIFFS.h>

#define LED_PIN 2
#define LED_PIN2 21

#define NUM_LEDS 32
#define NUM_LEDS2 10

CRGB leds[NUM_LEDS];
CRGB leds2[NUM_LEDS2];

const char* ssid = "esp32";
const char* password = "358866qwe";

const int ledPin = 2;

AsyncWebServer server(80);

const char html_page[] PROGMEM = R"rawliteral(
<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MY_BIKE</title>
</head>
    <style>
        body{
            background-color: #DCDCDC;
        }
        .line{
            height: 0.2vh;
            width: 100%;
            background-color: white;
        }
        .colorPicker{
            margin-top: 10%;
        }
        .toggle-btn {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
            margin-top: 1%;
        }

        .toggle-btn:hover {
            transform: scale(1.1);
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
        }

        .toggle-btn:active {
            transform: scale(1);
            box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.2);
        }
        .update{
            margin-top: 1%;
        }
        .input_update{
            height: 30px;
            width: 120px;
        }
        .container_icon{
            display: flex;
            justify-content: space-between; /* Розміщує елементи по краях */
            padding: 0 10px; 
            align-items: center;
        }
        .icon_btn{
            color: white;
            font-size: 5vw;
            border-radius: 25px;
            transition: all 0.3s ease;
            border: none; 
            background: none;
        }
        .icon_btn:hover {
            transform: scale(1.5);
        }
        .icon_back{
            color: #000;
            font-size: 7vw;
            border: none; 
            background: none;
            transition: all 0.3s ease;
        }
        .icon_back:hover{
            transform: scale(1.3);
        }

        .container_img {
            position: relative;
            display: block;
            text-align: center;

        }

        .container_img img {
            width: 100%; 
            height: auto;
            display: flex;
        }
        .led_line{
            position: absolute;
            width: 20%;
            height: 5px;
            border-radius: 50px;
            background-color: #000;
            transform: translate(-50%, -50%) rotate(50.8deg);
            left: 41%;
            top: 64%;
            opacity: 0.1;
            box-shadow: 0 0 5px #000, 0 0 10px #000, 0 0 20px #000, 
            0 0 40px #000, 0 0 60px #000, 
            0 0 100px #000, 0 0 150px #000, 
            0 0 200px #000, 0 0 300px #000, 
            0 0 400px #000, 0 0 500px #000, 0 0 600px #000, 0 0 700px #000, 0 0 800px #000;
        }
        .led_line.animation{
            background: linear-gradient(90deg, red, orange, yellow, green, cyan, blue, purple);
            background-size: 400% 400%;
            animation: rainbow 4s linear infinite, glow 4s linear infinite;
        }

        @keyframes rainbow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        @keyframes glow {
            0% { box-shadow: 0px 0px 20px 5px red; }
            20% { box-shadow: 0px 0px 30px 10px orange; }
            40% { box-shadow: 0px 0px 35px 15px yellow; }
            60% { box-shadow: 0px 0px 40px 15px green; }
            80% { box-shadow: 0px 0px 35px 15px blue; }
            100% { box-shadow: 0px 0px 30px 10px purple; }
        }
        .line_warning{
            display: none;
        }
        .line_warning_electromotor{
            position: absolute;
            width: 44%;
            height: 3px;
            transform: translate(-50%, -50%) rotate(120deg);
            background-color: #FF8C00;
            left: 65%;
            top: 74%;
        }
        .line_warning_battery{
            position: absolute;
            width: 29%;
            height: 3px;
            transform: translate(-50%, -50%) rotate(138deg);
            background-color: #FF8C00;
            left: 65%;
            top: 81%;
        }
        .message_warning{
            position: absolute;
            color: #FF8C00;
            top: 94%;
            left: 50%;
            width: 70%;
            font-size: 5vw;
            border-radius: 5%;
            transform: translate(-50%, -50%);
        }
        .switch { position: relative; display: inline-block; width: 60px; height: 34px; z-index: 1;}
        .switch input { opacity: 0; width: 0; height: 0; }
        .slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background: #ccc; transition: 0.4s; border-radius: 34px; }
        .slider:before { position: absolute; content: ""; height: 26px; width: 26px; left: 4px; bottom: 4px; background: white; transition: 0.4s; border-radius: 50%; }
        input:checked + .slider { background: #4CAF50; }
        input:checked + .slider:before { transform: translateX(26px); }
        .menu {
            display: none;
            position: absolute;
            top: 60%;
            left: 50%;
            transform: translateX(-50%);
            background: #C0C0C0;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            padding: 10px;
            min-width: 200px;
            z-index: 2;
        }
        .menu a {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 8px;
            text-decoration: none;
            color: black;
            height: 50px;
        }

        .menu a:hover {
            background: #ddd;
        }
        .menu a:not(:last-child) {
            border-bottom: 1px solid #ddd;
        }
        .range_br{
            width: 20%;
        
        }
        .large_speed {
            font-size: 35vw;
            font-weight: bold;
            color: #808080;
            text-shadow: 0 0 10px #000;
        }
        .small_speed {
            font-size: 10vw;
            position: relative;
            margin-left: -7%;
            color: #808080;
            text-shadow: 0 0 5px #000;
        }
        .speed_info{
            position: absolute;
            top: 20%; 
            left: 50%; 
            transform: translate(-50%, -50%);
        }
        .kmh{
            position: absolute;
            top: 35%; 
            left: 50%;
            transform: translate(-50%, -50%);
            text-shadow: 0 0 5px #000;
            font-size: 5vw;
            color: #808080;
        }
        .front_light{
            display: none;
            position: absolute;
            border: none; 
            background: none;
            background-color: white;
            height: 5%;
            width: 25%;
            top: 57%;
            border-radius: 100%;
            filter: blur(10px); 
            -webkit-mask-image: linear-gradient(to right, rgba(0, 0, 0, 0) 0%, black 80%);
            mask-image: linear-gradient(to right, rgba(0, 0, 0, 0) 0%, black 80%);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.8);
        }
        .back_light{
            display: none;
            position: absolute;
            background: none;
            border: none; 
            background-color: red;
            height: 3%;
            width: 12%;
            top: 57%;
            right: 1%;
            border-radius: 50%;
            filter: blur(10px); 
            -webkit-mask-image: linear-gradient(to left, rgba(0, 0, 0, 0) 0%, black 80%);
            mask-image: linear-gradient(to left, rgba(0, 0, 0, 0) 0%, black 80%);
            box-shadow: 0 0 50px rgba(255, 0, 0, 0.8);

        }
        .dashboard {
            display: flex;
            margin: auto;
            width: 90%;
            height: 10vh;
            margin-top: 5%;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 35px #000;
            text-align: center;
        }
        .stat {
            position: relative;
            margin: auto;
            flex: 1;
        }

        .big {
            font-size: 5vh;
            font-weight: bold;
            color: gray;
        }

        .small {
            font-size: 2vh;
            left: 7%;
            font-weight: bold;
        }

        .small-text {
            font-size: 1.8vh;
            color: gray;
            margin-top: 5px;
        }
        .line_separator{
            display: flex;
            position: relative;
            margin: auto;
            height: 80%;
            width: 1px;
            background-color: #D3D3D3;
        }
    </style>
</head>
<body>
    <div class = "container_icon">
        <button class = "icon_back" onclick="toBack()">↩︎</button>
        <button class = "icon_btn" onclick="showFields()">
        🔄 
        </button>
    </div>
    <div class = "line"></div>
    <div id = "info_body">
    <div class = "container_img">
    <div class = "speed_info" id = "speed">
        <span class="large_speed" id = "large_speed_number"></span>
        <span class="small_speed"  id = "small_speed_number"></span>
    </div>
    <div class = "kmh"><i>КМ/Ч</i></div>
    <div class = "front_light" id = "front_light_id"></div>
    <div class = "back_light" id = "back_light_id"></div>
    <img src='/image.png' alt='Мій велосипед' id = 'image_bike' />
    <div class = "line_warning" id = "warning">
        <div class = "line_warning_electromotor"></div>
        <div class = "line_warning_battery"></div>
        <div class = "message_warning">Високая нагрузка или низкий заряд батареи!</div>
    </div>
    <div class = "led_line" id = "led_line_bike"></div>
    <div class="menu" id="dropdownMenu">
        <a href="#" data-option="1">Задний фонарь 🔦</a>
        <a href="#" data-option="2">Аварийная сигнализация ❗</a>
        <a href="#" data-option="3">Сигнализация 🔊</a>
        <a href="#" data-option="4">Левый поворот ⬅️</a>
        <a href="#" data-option="5">Правый поворот ➡️</a>
        <a href="#" data-option="6">Настройки ⚙️</a>
    </div>
    </div>
    <div class="dashboard">
        <div class="stat">
            <div class="big"><span id="battery">0</span><span class="small">%</span></div>
            <div class="small-text">Текущий заряд батареи</div>
        </div>
        <div class = "line_separator"></div>
        <div class="stat">
            <div class="big"><span id="distance_ride">0.0</span><span class="small">км</span></div>
            <div class="small-text">Пробег за одну поездку</div>
        </div>
        <div class = "line_separator"></div>
        <div class="stat">
            <div class="big"><span id="distance">0.0</span><span class="small">км</span></div>
            <div class="small-text">Пробег на одном заряде</div>
        </div>
    </div>
    <input type="color" id="colorPicker" oninput="changeColor()" style="margin-top: 5%;">
    <input class = "range_br" type="range" id="opacity-range" min="0" max="255" step="1" value="1">
    <label class="switch">
        <input type="checkbox" id="toggleSwitch">
        <span class="slider"></span>
    </label>
    </div>
    <div class = "update" id="extraFields" style="display: none;">
        <input class = "input_update" id ="info_name" type="text" placeholder="Ім'я">
        <input class = "input_update" id = "info_password" type="text" placeholder="Пароль">
        <br><button class = "toggle-btn" onclick="Update()" style="font-size: 1vh; border: none; background: none; background-color: #C0C0C0;cursor: pointer; color: white;">
            Оновити
        </button>
    </div>
    <script>
        let xhr = new XMLHttpRequest();
        const opacityRange = document.getElementById('opacity-range');
        const line = document.getElementById('led_line_bike');
        const image = document.getElementById('image_bike');
        let led_state = false;
        const menu = document.getElementById("dropdownMenu");
        const menuItems = document.querySelectorAll(".menu a");
        let speed = 0;
        let lvl_battery = 0;
        image.addEventListener('click', function() {
            menu.style.display = menu.style.display === "block" ? "none" : "block";
        });
        function changeColor() {
            let color = document.getElementById("colorPicker").value;
            line.style.backgroundColor = colorPicker.value;
            line.style.boxShadow = `0 0 5px ${color}, 0 0 10px ${color}, 0 0 20px ${color}, 
            0 0 40px ${color}, 0 0 60px ${color}, 
            0 0 100px ${color}, 0 0 150px ${color}, 
            0 0 300px ${color}, 0 0 500px ${color}, 
            0 0 700px ${color}`;
            let r = parseInt(color.substr(1,2), 16);
            let g = parseInt(color.substr(3,2), 16);
            let b = parseInt(color.substr(5,2), 16);
            xhr.open("GET", `/set?r=${r}&g=${g}&b=${b}`, true);
            xhr.send();
        }
        function toBack(){
            document.getElementById("info_body").style.display = "block";
            document.getElementById("extraFields").style.display = "none";
        }
        function showFields() {
            let textElement = document.getElementById("extraFields");
            let infoBody = document.getElementById("info_body");
            textElement.style.display = "block";
            infoBody.style.display = "none";
        }
        function Update(){
            let textElement = document.getElementById("extraFields");
            let infoBody = document.getElementById("info_body");
            textElement.style.display = "none";
            infoBody.style.display = "block";
            speed = parseFloat(document.getElementById("info_name").value);
            lvl_battery = parseInt(document.getElementById("info_password").value)
            document.getElementById('battery').innerHTML = `<b>${lvl_battery}</b>`;
            xhr.open("GET", "/update", true);
            xhr.send();
        }
        document.getElementById("toggleSwitch").addEventListener("change", function() {
            let state = this.checked ? "on" : "off";
            let opacity = opacityRange.value;
            if(state === "on"){ line.style.opacity = opacity*0.0039; led_state = true;} else{line.style.opacity = 0; led_state = false;}
            xhr.open("GET", "/toggle?state=" + state, true);
            xhr.send();
        });
        opacityRange.addEventListener('input', function() {
            const opacity = opacityRange.value;
            xhr.open("GET", `/brightness=${opacity}`, true);
            xhr.send();
            if(led_state){
                line.style.opacity = opacity*0.0039;
            }
        });

        document.addEventListener("click", (event) => {
            if (!menuBtn.contains(event.target) && !menu.contains(event.target)) {
                menu.style.display = "none";
            }
        });
        menuItems.forEach(item => {
            item.addEventListener("click", function(event) {
                const optionText = event.target.getAttribute("data-option");
                dropdownMenu.style.display = "none";
                if(parseInt(optionText) === 1){document.getElementById('back_light_id').style.display = document.getElementById('back_light_id').style.display === "none" ? "block" : "none";}else if(parseInt(optionText) === 6){document.getElementById("info_body").style.display = "none";}else if(parseInt(optionText) === 3){document.getElementById('front_light_id').style.display = document.getElementById('front_light_id').style.display === "none" ? "block" : "none";}
                xhr.open("GET", `/option?id=${optionText}`, true);
                xhr.send();
            });
        });
        function displayNumber() {
            if(speed <= 99){
                let formatted = speed.toFixed(1).padStart(4, '0');
                let parts = formatted.split("."); 
                if(speed == 0){
                    document.getElementById('large_speed_number').style.color = "#808080"; document.getElementById('small_speed_number').style.color = "#808080";
                }
                else if(speed<= 25){
                    document.getElementById('large_speed_number').style.color = "#00FF00"; 
                    document.getElementById('small_speed_number').style.color = "#00FF00";
                } 
                else if(speed > 25 && speed <= 35){
                    document.getElementById('large_speed_number').style.color = "#FFFF00";
                    document.getElementById('small_speed_number').style.color = "#FFFF00";
                } 
                else if(speed > 35){
                    document.getElementById('large_speed_number').style.color = "#FF0000"; 
                    document.getElementById('small_speed_number').style.color = "#FF0000";
                }
                document.getElementById('large_speed_number').innerHTML = `<i>${parts[0]}</i>`;
                document.getElementById('small_speed_number').innerHTML = `<i>.${parts[1]}</i>`;
            }
            if(lvl_battery <= 10){document.getElementById("warning").style.display = "block"}else{document.getElementById("warning").style.display = "none"}
        }
        displayNumber();
        setInterval(displayNumber, 100);
        /*function fetchData() {
            fetch('/getData')
              .then(response => response.json())
              .then(data => {
                
              });
          }

          setInterval(fetchData, 1000); */
    </script>
</body>
</html>
)rawliteral";


void setup() {
    Serial.begin(115200);
    pinMode(ledPin, OUTPUT);
    digitalWrite(ledPin, LOW);
    FastLED.addLeds< WS2812, LED_PIN2, GRB>(leds2, NUM_LEDS2);
    FastLED.addLeds< WS2812, LED_PIN, GRB>(leds, NUM_LEDS);
    FastLED.setBrightness(255);
    WiFi.softAP(ssid, password);
    Serial.println(WiFi.softAPIP());
    server.on("/", HTTP_GET, [](AsyncWebServerRequest *request) {
      request->send(200, "text/html", html_page);
    });
    if (!SPIFFS.begin(true)) {
      Serial.println("Ошибка монтирования SPIFFS");
      return;
    }
    server.on("/image.png", HTTP_GET, [](AsyncWebServerRequest *request){
      request->send(SPIFFS, "/image.png", "image/png");
    });
    server.on("/set", HTTP_GET, [](AsyncWebServerRequest *request) {
        if (request->hasParam("r") && request->hasParam("g") && request->hasParam("b")) {
            int r = request->getParam("r")->value().toInt();
            int g = request->getParam("g")->value().toInt();
            int b = request->getParam("b")->value().toInt();
            for(int i = 0; i < NUM_LEDS; i++){
              leds[i] = CRGB(r, g, b);
            }
            FastLED.show();
            request->send(200, "text/plain", "OK");
        }
    });
    server.on("/update", HTTP_GET, [](AsyncWebServerRequest *request) {
      Serial.println("+");
    });
    server.begin();
}

bool updateFirmware(const char* url) {
  HTTPClient http;
  http.begin(url); // Начинаем запрос к URL
  int httpCode = http.GET(); // Выполняем GET запрос

  if (httpCode == HTTP_CODE_OK) {
    WiFiClient* stream = http.getStreamPtr();
    
    // Проверяем, доступен ли стрим для прошивки
    if (Update.begin(UPDATE_SIZE_UNKNOWN)) {
      size_t written = Update.writeStream(*stream); 

      if (written == http.getSize()) {
        if (Update.end()) {
          return true;
        } else {
          Serial.println("Update failed during end: " + String(Update.getError()));
        }
      } else {
        Serial.println("Update failed during write: " + String(Update.getError()));
      }
    } else {
      Serial.println("Not enough space for update");
    }
  } else {
    Serial.println("Error downloading firmware: " + String(httpCode));
  }
  
  http.end();
  return false;
}

void loop() {
}