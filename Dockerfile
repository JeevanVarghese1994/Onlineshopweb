# Extending image
FROM node:carbon

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Versions
RUN npm -v
RUN node -v

# Install app dependencies
COPY package.json /app/
COPY package-lock.json /app/

RUN npm install

# Bundle app source
COPY . /app

# Port to listener
EXPOSE 3000

# Environment variables
ENV NODE_ENV production
ENV PORT 3000
ENV PUBLIC_PATH "/"

# Main command
CMD [ "npm", "run", "start"]