# Go Docker

Belajar Docker dengan Go

## Prerequisites

- Docker
- Go

## Installation

```bash
git clone git@github.com:yusufbadurohman/go-docker.git go-docker
cd go-docker
docker build . -t go-docker
```

## How to run

```bash
docker run -it -e PORT=8083 -e INSTANCE_ID="Belajar docker" -p 8083:8083 go-docker
```
