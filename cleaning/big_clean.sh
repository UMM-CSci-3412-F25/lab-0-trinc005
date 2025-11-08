#!/bin/bash

set -euo pipefail

# Check arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 archive.tgz" >&2
    exit 1
fi

ARCHIVE=$1

if [ ! -f "$ARCHIVE" ]; then
    echo "Error: '$ARCHIVE' not found" >&2
    exit 1
fi

# Remember where we started so we can write the cleaned tar here
HERE=$(pwd)

# Make scratch directory
SCRATCH=$(mktemp -d)

cleanup() {
    rm -rf "$SCRATCH"
}
trap cleanup EXIT

# Extract archive into scratch directory
tar -xzf "$ARCHIVE" -C "$SCRATCH"

# Remove all files that contain the line "DELETE ME!"
# (work only on regular files, handle spaces with -print0 / -d '')
while IFS= read -r -d '' file; do
    if grep -q 'DELETE ME!' "$file"; then
        rm -f "$file"
    fi
done < <(find "$SCRATCH" -type f -print0)

# Build cleaned archive name: cleaned_<original-name>.tgz
BASE_NAME=$(basename "$ARCHIVE")
NEW_NAME="cleaned_${BASE_NAME}"

# Create new tar.gz from the contents of SCRATCH (no scratch path in names)
cd "$SCRATCH"
tar -czf "$HERE/$NEW_NAME" .