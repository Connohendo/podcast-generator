FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install PyYAML with override for PEP 668 restriction
RUN pip3 install PyYAML --break-system-packages

# Copy Python and entrypoint scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
