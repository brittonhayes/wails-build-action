#!/bin/sh -l

echo "Installing dependencies"
apt install -y libgtk-3-dev libwebkit2gtk-4.0-dev

echo "Installing cmd/wails"
go get -u github.com/wailsapp/wails/cmd/wails

echo "Navigating to github action workspace"
cd "$GITHUB_WORKSPACE/$INPUT_PATH" || exit

echo "Building application"
wails build "$INPUT_ARGS"
