# dockerized DEV environment

The scope of this project is to provide useful docker containers to ease development.

Added tools are:

### Cassandra


### Elasticsearch.

Default deployed at: `http://localhost:9200`


### Kibana

Useful to see and manage Elasticsearch data.

accessed via: `http://localhost:5601`


## Usage

First of all clone this repository in your desired location.

To start docker containers:
```console
➜ docker-compose up
```

To stop docker containers:
```console
➜ docker-compose down
```

## Scripts
under path ./scripts there are a set of useful Bash Scripts for Elasticsearch data management.

### Elasticsearch

There are several util scripts for manage Elastic Search Data.
- List Documents by ID
- List Documents
- List Indexes names
- List the Platform health (indexes, Nº Documents per index, status...)
- Add X sessions directly in elastic search with defined parameters (tenant, application, index, type....)
- Add a session directly in elastic search

Example of use:

1- go to $WORKDIR/cek-docker/scripts/elasticsearch

2- Execute as : *bash <path_to_script>.sh*