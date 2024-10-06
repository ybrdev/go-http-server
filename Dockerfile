# Stage 1: Build Stage
FROM golang:alpine AS builder
RUN apk add --no-cache git
WORKDIR /app

# Copy go.mod to cache dependencies
COPY go.mod ./
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the Go binary and name it 'binary'
RUN go build -o binary

# Stage 2: Minimal Runtime Stage
FROM alpine:latest
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/binary /app/binary

# Copy the SSL certificate and key files into the image
COPY server.crt server.key /app/

# Set a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port 443 for HTTPS
EXPOSE 443

# Set the entry point to run the 'binary' binary
ENTRYPOINT ["/app/binary"]
