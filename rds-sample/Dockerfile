FROM node:18.15.0-alpine

WORKDIR /app

COPY package.json index.js ./

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]