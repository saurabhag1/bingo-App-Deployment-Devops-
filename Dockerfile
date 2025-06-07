# Use a modern, stable Node.js base image
FROM node:20-slim

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the source code
COPY . .

# Build the app (for React/Next.js/etc.)
RUN npm run build

# Expose app port
EXPOSE 3000

# Start app in development mode (change to `start` for production)
CMD ["npm", "run", "dev"]
