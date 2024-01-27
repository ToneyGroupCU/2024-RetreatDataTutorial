#!/bin/bash

# The shebang line specifies that this script should be run using Bash.

# Save the current script's directory for later use.
# `dirname "${BASH_SOURCE[0]}"` retrieves the directory of the current script.
# `cd` changes to that directory, and `pwd` prints the working directory.
# The output of `pwd` is captured and stored in `SCRIPT_DIR`.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Move up one directory level from the script's location.
# The `..` represents the parent directory of the current working directory.
cd "$SCRIPT_DIR/.."

# Attempt to find and compress the example_xarray/ folder into a .tgz file.
# The `if` statement checks if the directory example_xarray/ exists in this location.
if [ -d "example_xarray/" ]; then
    # If the directory exists, use the tar command to compress it.
    # The flags used with tar are:
    # `-c` to create a new archive,
    # `-z` to gzip compress the archive,
    # `-v` for verbose output, listing files processed,
    # `-f` followed by the archive name, to specify the filename of the archive.
    tar -czvf example_xarray.tgz example_xarray/
else
    # If the directory does not exist, print an error message and exit the script with a non-zero status.
    echo "Directory example_xarray/ not found."
    exit 1
fi

# Copy the created .tgz file back to the script's original directory.
# This uses the `cp` command to copy the file.
# `$SCRIPT_DIR` is the destination, which is the directory where the script resides.
cp example_xarray.tgz "$SCRIPT_DIR"