#!/bin/bash

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --date) echo $(date) ;;
        --logs) 
            if [[ -z "$2" ]]; then
                for i in {1..100}; do
                    echo "log$i.txt - $0 - $(date)" > log$i.txt
                done
            else
                for i in $(seq 1 $2); do
                    echo "log$i.txt - $0 - $(date)" > log$i.txt
                done
            fi
            ;;
        --help) 
            echo "Usage: moj_skrypt.sh [options]"
            echo "Options:"
            echo "  --date   Display current date"
            echo "  --logs   Create log files"
            echo "  --help   Display help message"
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
while getopts ":hld:e:" option; do
    case "$option" in
        h) echo "Help message here";;
        l) echo "Create log files";;
        d) echo $(date);;
        e) 
            if [[ -z "$OPTARG" ]]; then
                for i in {1..100}; do
                    mkdir -p error$i && touch error$i/error$i.txt
                done
            else
                for i in $(seq 1 $OPTARG); do
                    mkdir -p error$i && touch error$i/error$i.txt
                done
            fi
            ;;
        :) echo "Option -$OPTARG requires an argument.";;
        *) echo "Unknown option: -$OPTARG"; exit 1;;
    esac
done
done

