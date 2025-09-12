nix_flags := "--extra-experimental-features flakes --extra-experimental-features nix-command"

default:
    ./status.sh

in_m:
    ./init.sh m
in_l:
    ./init.sh l
in_p:
    ./init.sh p
in_w:
    ./init.sh w

cf_m:
    ./cfg.sh m
cf_l:
    ./cfg.sh l
cf_p:
    ./cfg.sh p
cf_w:
    ./cfg.sh w

dv_python:
    nix develop {{ nix_flags }} ./aoc-python
dv_c:
    nix develop {{ nix_flags }} ./aoc-c
dv_zig:
    nix develop {{ nix_flags }} ./aoc-zig
dv_cpp:
    nix develop {{ nix_flags }} ./aoc-cpp
dv_rust:
    nix develop {{ nix_flags }} ./aoc-rust
dv_go:
    nix develop {{ nix_flags }} ./aoc-go
dv_lua:
    nix develop {{ nix_flags }} ./aoc-lua
dv_javascript:
    nix develop {{ nix_flags }} ./aoc-javascript
dv_ocaml:
    nix develop {{ nix_flags }} ./aoc-ocaml
dv_haskell:
    nix develop {{ nix_flags }} ./aoc-haskell

ds_m:
    ./destroy.sh m
ds_l:
    ./destroy.sh l
ds_p:
    ./destroy.sh p
ds_w:
    ./destroy.sh w
