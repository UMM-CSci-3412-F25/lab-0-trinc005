#!/bin/bash

TMP_DIR=$(mktemp -d)
HERE=$(pwd)
FILE_TO_TAR=$1

if [[ -f "$FILE_TO_TAR" ]]; then
  tar -xzf "$FILE_TO_TAR" -C "$TMP_DIR"
else
  echo "Error in 1"
  exit 1
fi

if [[ -d "$TMP_DIR" ]]; then
  grep -rl "DELETE ME!" "$TMP_DIR" | xargs rm -f
else
  echo "Error in 2"
  exit 1
fi

#For Creation:
BIG_DIR="big_dir.tgz"
LITTLE_DIR="little_dir.tgz"

if [[ "$FILE_TO_TAR" == "$BIG_DIR" ]]; then
  cd "$TMP_DIR"
  tar -czf "cleaned_big_dir.tgz"
  mv "clean_big_dir.tgz" "$HERE"
elif [[ "$FILE_TO_TAR" == "$LITTLE_DIR" ]]; then
  cd "$TMP_DIR"
  tar -czf "cleaned_little_dir.tgz"
  mv "clean_little_dir.tgz" "$HERE"
else
  echo "Error in 3"
  exit 1
fi
