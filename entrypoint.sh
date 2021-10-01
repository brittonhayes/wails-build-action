#!/bin/sh -l

echo "Installing dependencies"
sudo apt update && sudo apt install -y libgtk-3-dev libwebkit2gtk-4.0-dev

echo "Installing cmd/wails"
go get -u github.com/wailsapp/wails/cmd/wails

echo "Navigating to github action workspace"
cd "$GITHUB_WORKSPACE/$INPUT_PATH" || exit

export PATH=${PATH}:$(go env GOPATH)/bin
export LOG_LEVEL=debug
export GODEBUG=1

echo "Creating build directory"
mkdir -p ~/.wails
cp wails.json ~/.wails/

echo "Building application"
wails build "$INPUT_ARGS"
