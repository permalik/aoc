#!/usr/bin/env bash

ENV=$1
COMMIT_MSG="Pre-removal auto-commit"
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

cleanup() {
    repos=("$@")
    for r in "${repos[@]}"; do
        echo "Process: $r"
        if [ ! -d "$r/.git" ]; then
            echo "  Skipped. Not a git repo"
            continue
        fi

        cd "$r" || { echo "  Failed entry: $r"; continue; }

        if [[ -n $(git status --porcelain) ]]; then
            echo "  Detected changes: Add, Commit, and Push"

            git add -A
            git commit -m "$COMMIT_MSG"

            branch=$(git symbolic-ref --quiet --short HEAD || echo "main")

            git push origin "$branch"
            if [ $? -ne 0 ]; then
                echo "  Failed to push changes in $r. Abort removal"
                cd - >/dev/null
                continue
            fi
        else
            echo "  No changes. Remove directory"
        fi

        cd - >/dev/null
        echo "  Remove directory: $r"
        rm -rf "$r"
    done
}

if [ "$ENV" = "m" ]; then
    echo "MacOS not configured.."
elif [ "$ENV" = "l" ]; then
    echo "Windows not configured.."
elif [ "$ENV" = "p" ]; then
    echo "Configuring Parallels.."
    cleanup "${REPOS[@]}"
    echo "Configuration complete."
elif [ "$ENV" = "w" ]; then
    echo "Windows not configured.."
else
    echo "Usage: ./destroy.sh m|l|p|w (MacOS, Linux, Parallels, Windows)"
fi

