FROM node:20-alpine3.20

WORKDIR /tmp

COPY . .

EXPOSE 7860

RUN npm install
    
CMD ["npm", "start"]
