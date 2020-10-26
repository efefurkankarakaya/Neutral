echo "Junk scanner is starting.."

PURE=firefox
DEV=firefox-dev

count=0

if [ -d "$PURE" ]; then
    echo "$PURE found."
    count=$((++count))
    echo "$PURE removing.."
    rm -r "$PURE"
    echo "$PURE removed."
fi

if [ -d "$DEV" ]; then
    echo "$DEV found."
    count=$((++count))
    echo "$DEV removing.."
    rm -r "$DEV"
    echo "$DEV removed."
fi

if (( $count==0 )); then
    echo "No junks found."
else
    echo "$count junk(s) found and cleaned."
fi