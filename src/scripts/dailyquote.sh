#!/bin/bash

function inspire() {
    QUOTE=$(curl -s https://thequoteshub.com/api/)

    QUOTE_TEXT=$(echo "$QUOTE" | jq -r '.text')
    QUOTE_AUTHOR=$(echo "$QUOTE" | jq -r '.author')

    TEXT_COLOR="\033[3;37m"
    AUTHOR_COLOR="\033[3;36m"
    RESET_FORMATTING="\033[0m"

    MAX_LINE_LENGTH=80
    if [ ${#QUOTE_TEXT} -gt $MAX_LINE_LENGTH ]; then
        QUOTE_TEXT=$(echo "$QUOTE_TEXT" | fold -s -w $MAX_LINE_LENGTH)
    fi

    echo -e "\n❝${TEXT_COLOR}${QUOTE_TEXT}${RESET_FORMATTING}❞"
    echo -e "${AUTHOR_COLOR} - ${QUOTE_AUTHOR}${RESET_FORMATTING} -\n"
}

alias inspire='inspire'
