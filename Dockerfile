
FROM ubuntu:24.04

# Prevent interactive installation prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Java 21 and Nginx
RUN apt-get update && \
    apt-get install -y openjdk-21-jre-headless nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy HTML file into Nginx web directory
COPY index.html /var/www/html/index.html

# Expose Nginx HTTP port
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
