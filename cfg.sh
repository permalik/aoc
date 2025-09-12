#!/usr/bin/env bash

ENV=$1
REPO=aoc
REPOS=(
"$HOME/Docs/Git/aoc-python"
"$HOME/Docs/Git/aoc-c"
"$HOME/Docs/Git/aoc-zig"
"$HOME/Docs/Git/aoc-cpp"
"$HOME/Docs/Git/aoc-rust"
"$HOME/Docs/Git/aoc-go"
"$HOME/Docs/Git/aoc-lua"
"$HOME/Docs/Git/aoc-javascript"
"$HOME/Docs/Git/aoc-haskell"
)

config() {
    repo=$1
    shift
    repos=("$@")

    for r in "${repos[@]}"; do
        cp -r "$repo" "$r"
    done
}

if [ "$ENV" = "m" ]; then
    echo "MacOS not configured.."
elif [ "$ENV" = "l" ]; then
    echo "Windows not configured.."
elif [ "$ENV" = "p" ]; then
    echo "Configuring MacOS.."
    config "$REPO" "${REPOS[@]}"
    echo "Configuration complete."
elif [ "$ENV" = "w" ]; then
    echo "Windows not configured.."
else
    echo "Usage: ./cfg.sh m|l|p|w (MacOS, Linux, Parallels, Windows)"
fi

