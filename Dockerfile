FROM node:12-alpine as runtime

WORKDIR /code
COPY . /code

CMD ["npm", "start"]