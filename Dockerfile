# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Upgrade npm to avoid lockfileVersion compatibility issues
RUN npm install -g npm@latest

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the React or Next.js app
RUN npm run build

# Expose port 3000 (assuming app runs on 3000)
EXPOSE 3000

# Define the command to run your application
CMD ["npm", "run", "dev"]
