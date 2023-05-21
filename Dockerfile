FROM node:19.5.0-alpine

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3000

CMD ["node", "main.js"]
