const express =require("express");
const redis = require("redis");
const port = 8080;
//Redis Client 생성
/*
* 주의 : Docker 환경이 아니라면, url(https://redis-server.com)을 그대로 넣으면 되지만,
* Docker Compose를 사용할 때는 host 옵션을 docker-compose.yml 파일에 명시한 컨테이너 이름으로 줘야함.
*/
const client = redis.createClient({
  host: "redis-server",
  port: 6379//redis의 기본 포트
});
//redis 3.0.2 version에서는 정상 동작하는데, 최신 버전에서는 에러 발생.
const app = express();

//숫자는 0 부터 시작합니다.
client.set("number", 0);
app.get("/", (req, res) => {
  client.get("number", (err, number) => {
    //현재 숫자를 가져온 뒤 1 더한다.
    client.set("number", parseInt(number) + 1);
    res.send("숫자가 1씩 올라갑니다. 숫자:" + number);
  });
});

app.listen(port);
console.log("Server is running on port" + port);
