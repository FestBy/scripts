#!/bin/sh

STATEFILE="/tmp/kblayout_state"

if [ ! -f "$STATEFILE" ]; then
  echo 0 > "$STATEFILE"
fi

CURRENT=$(cat "$STATEFILE")
NEXT=$(( (CURRENT + 1) % 3 ))

case "$NEXT" in
  0)
    setxkbmap us
    ;;
  1)
    setxkbmap ua
    ;;
  2)
    setxkbmap ru
    ;;
esac

echo "$NEXT" > "$STATEFILE"

pkill -RTMIN+6 dwmblocks

