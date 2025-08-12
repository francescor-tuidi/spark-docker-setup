# spark-docker-setup

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Apache Spark](https://img.shields.io/badge/Apache%20Spark-FDEE21?style=flat-square&logo=apachespark&logoColor=black)


A lightweight setup to run Apache Spark in **master**, **worker**, and **Spark Connect** modes using a single Docker image.  
Ideal for **local development**, **testing**, and **CI pipelines**.

## Features
- One Dockerfile for all modes.
- `docker-compose` support for quick cluster setup.
- Ready for **Spark Connect** (default gRPC port `15002`).

## Quick Start

### Option 1 — Clone the repo
```bash
git clone https://github.com/francescor-tuidi/spark-docker-setup
cd spark-docker-setup
docker compose up -d
```

### Option 2 - Without cloning the repo
```bash
curl -s https://raw.githubusercontent.com/francescor-tuidi/spark-docker-setup/refs/heads/main/docker-compose.yml \
  | docker compose -f - up
```

## Connect with Spark Connect

```bash
from pyspark.sql import SparkSession
spark = SparkSession.builder.remote("sc://localhost:15002").getOrCreate()
spark.range(10).show()
```

## Useful Ports

| Service          | Port / URL                  | Description                              |
|------------------|-----------------------------|------------------------------------------|
| Master UI        | `http://localhost:8080`     | Web interface for Spark Master           |
| Cluster Endpoint | `spark://localhost:7077`    | Connection URL for classic Spark clients |
| Spark Connect    | `localhost:15002`           | gRPC endpoint for Spark Connect clients  |
