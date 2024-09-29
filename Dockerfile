# Use Node 16 as the base image
FROM node:16

# Create and set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --save

# Copy the entire application code to the container
COPY . .

# Expose the application port (default for Express.js is 3000)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
