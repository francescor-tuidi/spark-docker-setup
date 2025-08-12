#!/bin/bash
set -e

echo ">> Starting Spark Connect server..."
$SPARK_HOME/sbin/start-connect-server.sh --packages org.apache.spark:spark-connect_2.12:3.5.1 &

# Keep container alive
tail -f /dev/null
