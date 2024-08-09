# FROM ubuntu

# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -- 
# RUN apt-get upgrade --y
# RUN apt-get install -y nodejs


# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list, install curl, Node.js, and clean up
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install any additional dependencies if needed
RUN npm install

# Expose the port your app runs on
EXPOSE 3000

# Command to run your application
CMD ["node", "dist/index.js"]

