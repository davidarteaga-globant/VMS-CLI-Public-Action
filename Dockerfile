# Set the base image to use for subsequent instructions
FROM vmsys/clivms:latest

# Set the working directory inside the container
WORKDIR /app

# Copy any source file(s) required for the action
COPY entrypoint.sh .

# Configure the container to be run as an executable
ENTRYPOINT ["/app/entrypoint.sh"]