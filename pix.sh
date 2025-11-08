#!/bin/zsh
echo "Building HTML and CSS files using fluent.mojo..."
pixi run fluent 2> /dev/null
echo "Starting the server..."
pixi run serve