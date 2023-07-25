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