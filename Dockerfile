##################################################
# Build layer
##################################################
FROM node:17.6-alpine as build

WORKDIR /build
COPY . /build

RUN apk --no-cache add \
    python3 \
    make \
    g++ && \
    ln -sf python3 /usr/bin/python && \
    npm install

##################################################
# Runtime layer
##################################################
FROM node:17.6-alpine as runtime

WORKDIR /code
COPY --from=build /build /code
ENV NODE_OPTIONS="--max-old-space-size=8192"

CMD ["npm", "start"]