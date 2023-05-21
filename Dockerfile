FROM node:19.5.0-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

#RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "main.js"]
