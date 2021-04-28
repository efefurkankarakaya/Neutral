echo "Junk scanner is starting.."

PURE=firefox
BROWSER=$1

count=0

if [ -d "$PURE" ]; then
    echo "$PURE found."
    count=$((++count))
    echo "$PURE removing.."
    rm -r "$PURE"
    echo "$PURE removed."
fi

if [ -d "$BROWSER" ]; then
    echo "$BROWSER found."
    count=$((++count))
    echo "$BROWSER removing.."
    rm -r "$BROWSER"
    echo "$BROWSER removed."
fi

if (( $count==0 )); then
    echo "No junks found."
else
    echo "$count junk(s) found and cleaned."
fi