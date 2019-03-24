#!/usr/bin/env bash

# Lists given Number of documents for a given Index Name
main() {
    ask_index_name
    ask_number_docs
    run
}

function ask_index_name() {
    echo -e "\nEnter the name of the Index from where retrieve the documents, and press [ENTER]: "
    read index_name
}

function ask_number_docs() {
    while [ ! ${correct_number} ]; do
        echo -n -e "\nEnter number of documents you want to list, and press [ENTER]: "
        read num_docs

        case ${num_docs#[-+]} in
          *[!0-9]* | '') echo -e "\n$num_docs Not a number" ;;
          * ) correct_number=true ;;
        esac
    done
}

run() {
    echo -e "\nRetrieving $num_docs documents from index $index_name. \n"
    echo -e "\n Result: \n"
    curl -XGET "localhost:9200/$index_name/_search/?size=$num_docs&pretty=true"
    echo -e "\n"
}

main