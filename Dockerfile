FROM node:19-alpine3.16 as prod
WORKDIR /app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
RUN npm install pm2 -g
CMD pm2-runtime 'npm start'
# CMD [ "ping", "google.com" ]

FROM nginx
# EXPOSE 80
COPY --from=prod /app/default.conf /etc/nginx/conf.d/
CMD [ "ping", "google.com" ]


# FROM node:19-alpine3.16
# WORKDIR /app
# RUN npm install pm2 -g
# RUN pm2 start npm --name "srmportal" -- start
# CMD [ "ping", "google.com" ]

# FROM keymetrics/pm2:latest-alpine
# WORKDIR /app
# RUN ls -al -R
# CMD [ "pm2", "start", "npm", "--name", "srmportal", "--", "start"]
# # pm2 start npm --name "Acetor" -- start

