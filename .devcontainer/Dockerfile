# Simple environment setup for prototype MCP agent
FROM nikolaik/python-nodejs:latest

# Set working directory inside the container
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Go programming language
RUN curl -fsSL https://go.dev/dl/go1.24.2.linux-amd64.tar.gz | tar -C /usr/local -xz \
    && echo 'export PATH=/usr/local/go/bin:$PATH' >> /etc/profile

# Add Go to the PATH
ENV PATH="/usr/local/go/bin:${PATH}"

# Install Pixi
RUN curl -fsSL https://pixi.sh/install.sh | bash

# Add Pixi to the PATH
ENV PATH="/root/.pixi/bin:${PATH}"

# Expose the Streamlit default port
EXPOSE 8501

# Command to keep the container running
CMD ["sleep", "infinity"]