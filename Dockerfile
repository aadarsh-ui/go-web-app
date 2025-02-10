# Use an official Go runtime as a parent image
FROM golang:1.23-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the Go modules manifests to the container
COPY go.mod  ./

# Download Go module dependencies
RUN go mod tidy

# Copy the rest of the application code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8080 (change this depending on your app's port)
EXPOSE 8080

# Run the Go application
CMD ["./main"]


