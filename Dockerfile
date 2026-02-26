FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    python3 \
    git \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /demo

COPY . /opt/git-commit-generator

RUN chmod +x /opt/git-commit-generator/gcm* \
    && ln -s /opt/git-commit-generator/gcm* /usr/local/bin/gcm

RUN git config --global user.email "demo@example.com" \
    && git config --global user.name "Demo User"

CMD ["/bin/bash"]