# Using the Secondo Image

# Run

The image can be started as described in the following.

## Stateless Server

In order to run the SecondoMonitor:

    docker container run -it --name secondo -p 1234:1234 secondo:0.4.0

## Server With Volume

    docker container run -it --name secondo --mount source=secondo-databases,target=/database/secondo-databases -p 1234:1234 secondo:0.4.0

## Shell

### Access a Running Container

In order to get a shell into a running secondo use:

    docker exec -it secondo /bin/bash

### Shell to a new Container

You can start a Secondo container with a shell by executing:

    docker run -it secondo:0.4.0 /bin/bash

You can then open an interactive Secondo TTY:
    
    cd /database/secondo/bin
    SecondoTTYBDB

Within the TTY execute as described in the Secondo manual [1]:

    restore database berlintest from berlintest;
    query mrain atinstant instant("2003-11-20-06:06");
    close database;

## Volume

Create a volume:

    docker volume create secondo-databases

Delete a volume:

    docker volume rm secondo-databases

## Deleting the Container

In order to delete a named container:

    docker container rm secondo


## Links
1. Secondo User Manual, http://dna.fernuni-hagen.de/secondo/files/Documentation/General/SecondoManual.pdf