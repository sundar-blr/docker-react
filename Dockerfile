# Specify a base image
#FROM node:alpine
FROM node:12.18.1 as builder

WORKDIR /app

# Install some depenendencies
COPY package.json ./

RUN npm install
COPY . .

EXPOSE 3000

# Default command
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


