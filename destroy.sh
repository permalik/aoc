#!/bin/bash

repos=(
    "/home/parallels/Docs/Git/aoc-python"
    "/home/parallels/Docs/Git/aoc-c"
    "/home/parallels/Docs/Git/aoc-zig"
    "/home/parallels/Docs/Git/aoc-cpp"
    "/home/parallels/Docs/Git/aoc-rust"
    "/home/parallels/Docs/Git/aoc-go"
    "/home/parallels/Docs/Git/aoc-lua"
)

commit_msg="Pre-removal auto-commit"

for repo in "${repos[@]}"; do
    echo "Process: $repo"
    if [ ! -d "$repo/.git" ]; then
        echo "  Skipped. Not a git repo"
        continue
    fi

    cd "$repo" || { echo "  Failed entry: $repo"; continue; }

    if [[ -n $(git status --porcelain) ]]; then
        echo "  Detected changes: Add, Commit, and Push"

        git add -A
        git commit -m "$commit_msg"

        branch=$(git symbolic-ref --quiet --short HEAD || echo "main")

        git push origin "$branch"
        if [ $? -ne 0 ]; then
            echo "  Failed to push changes in $repo. Abort removal"
            cd - >/dev/null
            continue
        fi
    else
        echo "  No changes. Remove directory"
    fi

    cd - > /dev/null
    echo "  Remove directory: $repo"
    rm -rf "$repo"
done

