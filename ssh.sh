#!/bin/sh

if [ -n "$TMUX" ]; then
   tmux detach -E "kitty +kitten ssh \"$@\""
else
   kitty +kitten ssh "$@"
fi

