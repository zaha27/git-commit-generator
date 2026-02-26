FROM debian:12

RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    zstd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /demo
CMD ["/bin/bash"]