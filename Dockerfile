FROM node:alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 5000

<<<<<<< HEAD
CMD [ "node", "app.js" ]
=======
CMD [ "node", "index.js" ]
>>>>>>> fba739d4cf744935b1e5148fda121e82e887f962
