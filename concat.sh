#!/bin/bash

blacklist=("header.txt" "concat.sh" ".github" ".git" "README.md" "release.sh" "release")

function aggregate_cards() {
	local dir_name=$1
	local header=$2
	local allow_duplicates=$3
	local target_file="u_$dir_name.txt"

    if [ -n "$header" ]; then
        touch "$target_file"
        comm -23 <(echo "$header" | sort) <(sort "$target_file") >> "$target_file"

        for FILE in *.txt; do
            if [ -s "$FILE" ] && [ "$FILE" != "$target_file" ]; then
				if [ "$allow_duplicates" == "true" ]; then
					 tail -n +3 "$FILE" >> "$target_file"
				else
					comm -23 <(sort "$FILE") <(sort "$target_file") >> "$target_file"
				fi
            fi
        done

        cp "$target_file" "../release"

    else
        echo "No header content provided"
    fi
}

function run_all() {
	local allow_duplicates=$1
	local header_content=$(cat header.txt)
    mkdir -p release
    
    if [ "$allow_duplicates" = "" ]; then 
        allow_duplicates="false"
    fi
    
    for d in *; do
		dir_name=$(basename "$d")
        if [[ ! " ${blacklist[@]} " =~ " ${d} " ]]; then
            cd "$d" || exit
            aggregate_cards "$dir_name" "$header_content" "$allow_duplicates"
            cd - || exit
        fi
    done
}

run_all $1 
