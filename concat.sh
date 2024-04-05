#!/bin/bash

blacklist=("header.txt" "concat.sh" ".github" ".git")

function aggregate_cards() {
	local dir_name=$1
	local header=$2
	local target_file="$dir_name.txt"

    if [ -n "$header" ]; then
        touch "$target_file"
        comm -23 <(echo "$header" | sort) <(sort "$target_file") >> "$target_file"

        for FILE in *.txt; do
            if [ -s "$FILE" ] && [ "$FILE" != "$target_file" ]; then
                comm -23 <(sort "$FILE") <(sort "$target_file") >> "$target_file"
            fi
        done
    else
        echo "No header content provided"
    fi
}

function run_all() {
	local header_content=$(cat header.txt)
    for d in */; do
		dir_name=$(basename "$d")
        if [[ ! " ${blacklist[@]} " =~ " ${d} " ]]; then
            cd "$d" || exit
            aggregate_cards "$dir_name" "$header_content"
            cd - || exit
        fi
    done
}

run_all
