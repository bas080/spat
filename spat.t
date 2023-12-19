#!/usr/bin/env spat

set -x

# A variable line where we use a regex.
date -I

tmp="/tmp/spat.test.sh"

echo 'echo hello' > "$tmp"

spat "$tmp"

spat "$tmp"
echo "Exit Code: $?"

echo 'echo world' >> "$tmp"

spat "$tmp"
echo "Exit Code: $?"

rm -v "$tmp" "$tmp.out"
