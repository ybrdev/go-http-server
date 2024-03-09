# Go Docker

Belajar membuat HTTP Server dengan Go

## Prerequisites

- Docker
- Go

## Installation

```bash
git clone git@github.com:yusufbadurohman/go-http-server.git go-http-server
cd go-http-server
docker build . -t go-http-server
```

## How to run

```bash
docker run -d -p 80:80 --name go-http-server-1 go-http-server
```
