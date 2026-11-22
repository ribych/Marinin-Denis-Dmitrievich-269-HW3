Ответ на 4 балла в logs.txt

Для ответа на 6 баллов: .env.example
$ docker compose up -d --build
$ curl -fsS -X POST http://localhost:8085/increment
$ curl -fsS -X POST http://localhost:8085/increment
$ curl -fsS http://localhost:8085/
{"greeting":"Привет из Docker Compose!","count":2,...}  # count = 2
$ docker compose down
[+] Running 2/2
 ✔️ Container hw_3_template-app-1  Removed
 ✔️ Network hw_3_template_default  Removed

$ docker compose up -d
[+] Running 2/2
 ✔️ Network hw_3_template_default  Created
 ✔️ Container hw_3_template-app-1  Started

$ curl -fsS http://localhost:8085/
{"greeting":"Привет из Docker Compose!","count":2,...}  # count всё ещё = 2

Для ответа на 8 баллов:
Пункт 1
Выполнено 3 инкремента. Значение count = 3.
$ curl -fsS http://localhost:8080/
{"count":3,...}

$ docker compose down
[+] Running 2/2
 ✔️ Container ... Removed
 ✔️ Network ... Removed

$ docker compose up -d
[+] Running 2/2
 ✔️ Container ... Started

$ curl -fsS http://localhost:8080/
{"count":3,...}
count всё ещё = 3

Пункт 2
docker compose stop redis/
curl -s -o /dev/null -w "healthz: %{http_code}\n" http://localhost:8080/healthz (нужно 200, выдало 200)
curl -s -o /dev/null -w "readyz: %{http_code}\n" http://localhost:8080/readyz (нужно 200, выдало 200)
curl -s -o /dev/null -w "increment: %{http_code}\n" -X POST http://localhost:8080/increment (нужно 503, выдало 503)

Пункт 3:

При перезапуске redis сохраняется значение count (=2)
curl -fsS http://localhost:8080/
curl -fsS -X POST http://localhost:8080/increment
count = 3 => каждый новый инкремент даёт count += 1
