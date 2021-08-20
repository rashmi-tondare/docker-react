FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# the next FROM statement indicates a new block
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html