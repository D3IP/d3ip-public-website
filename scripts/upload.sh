#!/bin/bash

# Set script to echo all the output when running
set -x

# Check if the file name was provided
if [ -z "$1" ]
then
    echo "No file provided"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]
then
    echo "File does not exist"
    exit 1
fi

# Copy the file to the destination directory
cp "$1" ./static-site-zip/

# Change to the destination directory
cd ./static-site-zip/ || exit

# Copy the file the name used by pipeline job
cp "$1" "simply-static.zip"

# Update local git repo
git pull

# Add the file to the git repo
git add .

# Commit the changes
git commit -m "Added file $1"

# Push to repo
git push