#!/usr/bin/env bash

# List all indexes names for a given Index Type
main() {
    ask_index_type
    run
}

ask_index_type(){
    echo -n -e "\nEnter the Index Type (visit, error, event....) and press [ENTER]: "
    read index_type
}

run() {
    echo -e "\nRetrieving Indexes typed as $index_type. \n"
    echo -e "\n Result: \n"
    curl "localhost:9200/_cat/indices/$index_type*?h=index&s=index:desc"
    echo -e "\n"
}

main