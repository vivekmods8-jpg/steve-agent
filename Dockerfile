FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir hermes-agent

ENV HOME=/app
ENV HERMES_HOME=/app/.hermes

EXPOSE 9119

CMD ["hermes", "gateway", "run"]
