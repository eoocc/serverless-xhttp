FROM node:alpine3.20

WORKDIR /tmp

COPY app.js package.json index.html ./

EXPOSE 7860

RUN apk add --no-cache curl bash && \
    npm install && \
    chmod +x app.js

CMD ["npm", "start"]
