# Step 1: Use a Node.js image to build the application
FROM node:16 AS build

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
# RUN npm install
RUN npm install --registry=https://registry.npmjs.org/


# Copy the application code
COPY . .

# Build the application
RUN npm run build

# Step 2: Use an Nginx image to serve the built files
FROM nginx:alpine

# Copy the built application files to Nginx's default directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
