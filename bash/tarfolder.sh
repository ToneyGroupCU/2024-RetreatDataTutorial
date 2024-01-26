#!/bin/bash

# This is the shebang line which tells the system this file should be run using bash

# Save the current script's directory
# - `$(dirname "${BASH_SOURCE[0]}")` gets the directory of the current script.
# - `cd` changes to that directory, and `pwd` prints the working directory.
# - The output of `pwd` is captured and stored in `SCRIPT_DIR`.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Move up one directory from the script location
# The `..` represents the parent directory of the current working directory.
cd ..

# Find the /example_xarray/ folder and pack it into a .tgz file
# The `if` statement checks if the directory /example_xarray/ exists.
# - If it does, tar command is used to create a compressed (gzipped) tar archive of the directory.
# - The flags used with tar are:
#   - `-c` to create a new archive,
#   - `-z` to gzip compress the archive,
#   - `-v` to verbosely list files processed,
#   - `-f` followed by the archive name, to specify the filename of the archive.
if [ -d "/example_xarray/" ]; then
    tar -czvf example_xarray.tgz /example_xarray/
else
    # If the directory is not found, print an error message and exit the script with a non-zero status.
    echo "Directory /example_xarray/ not found."
    exit 1
fi

# Copy the .tgz file to the script's original directory
# `cp` command is used to copy the created .tgz file to the directory where the script resides.
# `$SCRIPT_DIR` is the destination directory which was stored earlier.
cp example_xarray.tgz "$SCRIPT_DIR"
