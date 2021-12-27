# Node 10버전이 베이스 이미지
FROM node:10

# (이미지 생성 전) Node 프로젝트에 대해 dependency를 모두 설치한다.
RUN npm install

# (컨테이너 생성 후) Node application 기동 명령어.
CMD ["node", "server.js"]