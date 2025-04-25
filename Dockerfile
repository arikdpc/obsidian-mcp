# Use official Node.js LTS base image
FROM node:20-slim

# Create app directory
WORKDIR /app

# Copy only built files and necessary runtime files
COPY build ./build
COPY package.json ./package.json
COPY package-lock.json ./package-lock.json

# Install production dependencies
RUN npm install --only=production

# Expose stdio - no ports needed because MCP runs on stdin/stdout
CMD ["node", "build/main.js", "/vault"]
