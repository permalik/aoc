#!/usr/bin/env bash

ENV=$1

clone() {
    git clone git@github.com:permalik/aoc-python.git
    git clone git@github.com:permalik/aoc-c.git
    git clone git@github.com:permalik/aoc-zig.git
    git clone git@github.com:permalik/aoc-cpp.git
    git clone git@github.com:permalik/aoc-rust.git
    git clone git@github.com:permalik/aoc-go.git
    git clone git@github.com:permalik/aoc-lua.git
    git clone git@github.com:permalik/aoc-javascript.git
    git clone git@github.com:permalik/aoc-haskell.git
}

if [ "$ENV" = "m" ]; then
    echo "Initializing MacOS.."
    cd ..
    clone
    echo "MacOS Initialized.."
elif [ "$ENV" = "l" ]; then
    echo "Initializing Linux.."
    cd ..
    clone
    echo "Linux Initialized.."
elif [ "$ENV" = "p" ]; then
    echo "Initializing Parallels.."
    cd ..
    clone
    echo "Parallels Initialized.."
elif [ "$ENV" = "w" ]; then
    echo "Windows not configured.."
else
    echo "Usage: ./init.sh m|l|p|w (MacOS, Linux, Parallels, Windows)"
fi

