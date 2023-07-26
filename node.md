# câu lệnh chạy project 
docker-compose -f docker-compose-test.yml

# host

http://localhost:8080/person





# node
docker build -t api_vue .
docker run --name vue_api -p 5001:8081 -it -v ${PWD}/app:/app:rw api_vue /bin/bash


npm install -g @vue/cli
npm run build
npm install --save bootstrap-vue
npm run serve


"scripts": {
  "serve": "set NODE_OPTIONS=--openssl-legacy-provider && vue-cli-service serve",
  "build": "set NODE_OPTIONS=--openssl-legacy-provider && vue-cli-service build",
  "lint": "set NODE_OPTIONS=--openssl-legacy-provider && vue-cli-service lint"
},

docker build -t api_vue .
docker-compose -f docker-compose-test.yml up



docker login registry.gitlab.com
docker build -t registry.gitlab.com/tranvanchilong/async_web_gia:v0.2 . 
docker run --name test -it -p 5002:8000 -v ${PWD}/app:/app:rw registry.gitlab.com/tranvanchilong/async_web_gia:v0.9 /bin/bash 
registry.gitlab.com/tranvanchilong/async_web_gia:v0.9
docker push registry.gitlab.com/tranvanchilong/async_web_gia:v0.9


