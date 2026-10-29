dockerfile
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir hermes-agent

ENV HOME=/app
ENV HERMES_HOME=/app/.hermes

EXPOSE 9119

CMD ["hermes", "gateway", "run"]
