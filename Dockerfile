FROM node:15-alpine
ENV NODE_ENV=production
WORKDIR /usr/src/app

# Copy package.json, package-lock.json*, npm-shrinkwrap.json* and install modules
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install

# Copy src
COPY src src

EXPOSE 3000
CMD ["npm", "start"]
