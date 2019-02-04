FROM node:carbon
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
/*copy all files to current directory */
COPY . .   
/* port forwarding . expose 8080 to hit the application */
Expose 8080
CMD ["npm","start"]
