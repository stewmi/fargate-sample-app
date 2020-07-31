FROM node:13.12.0-alpine


WORKDIR /app

# Copy in source and install dependencies
COPY src/ ./
RUN npm install

EXPOSE 3000
CMD ["node", "index.js"]