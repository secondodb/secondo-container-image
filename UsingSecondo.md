# Using Secondo

Assumption: a Secondo container has been started.

## Get a Shell into the Container

    docker exec -it secondo /bin/bash

## Connect to the shared IP Address

Once inside the container with `bash`:

Use `ifconfig` to identify the shared IP address, e.g. `192.168.86.47`.

The use: 

    ./SecondoTTYCS -h 192.168.86.47 -p 1234

To see if Secondo has bound to the interface correctly.