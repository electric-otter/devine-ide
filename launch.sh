#!/bin/bash

echo "Current directory before: $(pwd)"

cd "$(dirname "$0")"

./terminal.lua
./texteditor.sh
./files.py
./debugger.py
./addonstore.py
