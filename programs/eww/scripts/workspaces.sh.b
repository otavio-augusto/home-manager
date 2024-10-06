#!/bin/bash

function get_workspaces_info() {
    output=$(swaymsg -t get_workspaces | jq '.[].name' | sed 's/"//g' )
    echo $output | sed 's/ /, /g' | sed 's/.*/[&]/' 
}

get_workspaces_info

swaymsg -t subscribe '["workspace"]' --monitor | {
    while read -r event; do
        get_workspaces_info
    done
}
