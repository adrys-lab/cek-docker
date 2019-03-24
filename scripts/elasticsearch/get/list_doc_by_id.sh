#!/usr/bin/env bash

# Retrieve a Single Document given Document ID
main() {
    ask_index_name
    ask_index_type
    ask_document_id
    run
}

function ask_index_name() {
    echo -n -e "\nEnter the name of the Index from where retrieve the documents, and press [ENTER]: "
    read index_name
}

ask_index_type(){
    echo -n -e "\nEnter the Index Type (visit, error, event....) and press [ENTER]: "
    read index_type
}

function ask_document_id() {
    echo -n -e "\nEnter the Document ID to retrieve, and press [ENTER]: "
    read doc_id
}

run() {

    echo -e "\nRetrieving Document ID $doc_id from index $index_name  typed as $index_type. \n"
    echo -e "\n Result: \n"

    curl -H "Content-Type: application/json" -XPOST "localhost:9200/$index_name/$index_type/_search/?pretty=true" -d "
    {
        \"query\": {
            \"bool\": {
             \"filter\": {
                    \"term\": {
                       \"_id\": \"$doc_id\"
                    }
                }
            }
        }
    }"
    echo -e "\n"
}

main