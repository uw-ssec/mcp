#!/bin/bash
set -e

echo "🔧 Setting up environment..."

# Ensure Pixi is in the PATH and properly installed
if ! command -v pixi &> /dev/null; then
    echo "Installing Pixi..."
    curl -fsSL https://pixi.sh/install.sh | bash
    export PATH="$HOME/.pixi/bin:$PATH"
    echo 'export PATH="$HOME/.pixi/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/.pixi/bin:$PATH"' >> ~/.profile
fi

echo "✅ Pixi version: $(pixi --version)"

# Check Go installation
echo "🔧 Checking Go installation..."
go version || echo "Warning: Go is not installed or not added to PATH"
go install -v golang.org/x/tools/gopls@v0.18.1 || echo "Warning: gopls installation failed"
echo "✅ Go version: $(go version)"
echo "✅ gopls version: $(gopls version)"

# Initialize Pixi project if needed
if [ ! -f "pixi.lock" ]; then
    echo "Initializing Pixi dependencies..."
    pixi install || echo "Warning: Pixi install command failed, continuing..."
fi

echo "✅ Environment setup complete!"