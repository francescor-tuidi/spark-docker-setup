# Dockerfile
FROM apache/spark:3.5.1-python3
USER root

# Entrypoint custom per Spark Connect
COPY scripts/docker_start_spark.sh /opt/bitnami/spark/entrypoint.sh
RUN chmod +x /opt/bitnami/spark/entrypoint.sh

ENTRYPOINT ["/opt/bitnami/spark/entrypoint.sh"]