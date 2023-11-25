#!/bin/sh
if [ $# -ne 1 ]; then
    echo "Fournir un nom en parametre"
    exit 1
fi

if [ -d "$1" ]; then
    exit 0
else
    "$0" `dirname "$1"`
    mkdir "$1"
fi
