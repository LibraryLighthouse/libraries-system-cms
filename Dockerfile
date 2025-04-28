FROM node:18-alpine3.18
RUN apk update
RUN apk upgrade
RUN apk add ffmpeg
WORKDIR /app
COPY ./*.json .
COPY ./yarn.lock .
RUN yarn install --production
COPY . .
RUN yarn build
CMD ["yarn", "start"]
EXPOSE 3005