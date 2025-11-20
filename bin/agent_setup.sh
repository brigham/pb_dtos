#!/bin/bash

### Setup script for agents.
mkdir "$HOME/develop"

# Set up Dart.
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update -y
sudo apt-get install -y dart=3.10.0-1

# Set up pocketbase.
POCKETBASE_URL="https://github.com/pocketbase/pocketbase/releases/download/v0.31.0/pocketbase_0.31.0_linux_amd64.zip"
ARCH=$(uname -m)

if [ "$ARCH" = "aarch64" ]; then
    POCKETBASE_URL="https://github.com/pocketbase/pocketbase/releases/download/v0.31.0/pocketbase_0.31.0_linux_arm64.zip"
fi
curl -L "$POCKETBASE_URL" -o "$HOME/develop/pocketbase.zip"
unzip -o "$HOME/develop/pocketbase.zip" -d "$HOME/develop/pocketbase"
rm "$HOME/develop/pocketbase.zip"
mkdir -p "$HOME/develop/pocketbase/pb_migrations"
cp /app/pocketbase/migrations/* "$HOME/develop/pocketbase/pb_migrations/"
