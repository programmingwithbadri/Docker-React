FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build -> will contain the output of npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
# COPY --from=builder - Copying from previous stage
# /app/build - from folder
# /usr/share/nginx/html - to folder s per nginx doc