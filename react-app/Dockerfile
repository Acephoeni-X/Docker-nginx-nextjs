FROM node:19-alpine3.16 as prod
WORKDIR /app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
CMD ["npm", "start"]
