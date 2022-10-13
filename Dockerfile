FROM node:15-alpine as base

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

EXPOSE 8080

#RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
#COPY . .

#CMD [ "node", "server.js" ]


FROM base as production

ENV NODE_ENV=production
RUN npm ci --only=production

CMD ["node", "server.js"]


FROM base as dev

ENV NODE_ENV=development
RUN npm config set unsafe-perm true && npm install -g nodemon
RUN npm install

CMD ["npm", "start"]

# Now you can build your image from the command line
# $ docker build -t <your username>/docker-web-app .

# Run your image
# $ docker run -p 8080:8080 -d <your username>/docker-web-app
