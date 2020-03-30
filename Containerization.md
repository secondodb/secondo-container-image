# Dockerfile

This document provides information about the `Dockerfile`. Mostly, they represent learnings during the `Dockerfile` creation and maintenance.

## RUN `apt-get install`
Before running `apt-get update` there is no package cache inside the container. Therefor the attempt to install a package such as `apt-get install wget` will fail. Therefore `apt-get update` has to be run before any `apt-get install` is run.

According to the [best practises for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) it is recommended to install many packages with a single run command rather than a number of `RUN` commands. This reduces the number of file system layers created as each `RUN` instruction creates a filesystem layer.

## PATH Variable

The Secondo binary path needs to be listed in the `PATH` environment variable. Otherwise scripts such as `SecondoTTYBDB` won't work.

# Files Used by the Dockerfile

## `create-secondorc.sh`

Added the following line:

    echo 'export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"' >>$COMPILE_WORKDIR/.secondorc

To avoid an `javac` error: `unmappable character for encoding ascii`.

## `SecondoConfig.ini`

* Changed the bind address from `127.0.0.1` to `0.0.0.0` to allow external access to the secondo process.