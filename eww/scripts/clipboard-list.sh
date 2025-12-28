#!/usr/bin/env bash

# Start JSON array
echo -n "["

first=true

# IFS=$'\t' ensures we split strictly by TAB, not spaces
cliphist list | head -n 10 | while IFS=$'\t' read -r id content; do

    # Check for image type
    if cliphist decode <<<"$id" | file --mime-type - | grep -q image/; then
        kind="image"
        preview="Image"
    else
        kind="text"
        # Decode the actual content for the preview
        raw_text=$(cliphist decode <<<"$id" | head -n 1 | tr '\n' ' ')
        
        # Clean up text for JSON:
        # 1. Escape backslashes (\)
        # 2. Escape double quotes (")
        # 3. Remove control characters (like tabs/weird symbols) that break JSON
        preview=$(echo "$raw_text" | sed 's/\\/\\\\/g; s/"/\\"/g; s/[\t]/ /g' | cut -c -30)
    fi

    # Handle comma separation
    if [ "$first" = true ]; then
        first=false
    else
        echo -n ","
    fi

    # Output valid JSON
    echo -n "{\"id\": \"$id\", \"kind\": \"$kind\", \"preview\": \"$preview\"}"
done

# End JSON array
echo "]"

