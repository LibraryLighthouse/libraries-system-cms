FROM node:20-alpine
RUN apk update
RUN apk upgrade
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install 
COPY . .
RUN npm run build
CMD ["npm", "run", "start"]
EXPOSE 3000