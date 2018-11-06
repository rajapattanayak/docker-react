# Build Phase
FROM node:alpine as builder

WORKDIR '/app'

#COPY package.json .
# For AWS BeanStalk
COPY package*.json ./
#RUN npm install
RUN yarn install --upgrade
COPY . .
#RUN npm run build
RUN yarn build


# Run Phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


