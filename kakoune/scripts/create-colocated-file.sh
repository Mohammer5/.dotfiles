#!/bin/bash

# Local variables
KAK_SESSION=$1
KAK_CLIENT=$2
KAK_BUFFILE=$3
FILENAME=$4

# Create the file
touch "$(dirname $KAK_BUFFILE)/$FILENAME"

# Edit the newly created file
KAK_CMD="evaluate-commands -client $KAK_CLIENT edit $FILENAME"
echo "$KAK_CMD" | kak -p "$KAK_SESSION"
