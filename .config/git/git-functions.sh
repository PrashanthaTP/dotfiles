#!/bin/bash

gcd(){
    local target_dir="$(git rev-parse --show-toplevel)"
    echo "Changing diretory to ${target_dir}"
    cd "${target_dir}"
}

Gcd(){
    # works in submodules
    local target_dir="$(git rev-parse --show-superproject-working-tree)"
    echo "Changing diretory to ${target_dir}"
    cd "${target_dir}"
}
