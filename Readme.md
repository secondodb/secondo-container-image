# Secondo Container Image

## About Secondo

> Secondo is an extensible database system supporting especially non-standard applications. Designed at the FernUniversität in Hagen, Secondo is a platform for implementing and experimenting with various kinds of data models. [1]

> The Secondo system is extensible by algebra modules, using a well defined interface. New data models and data structures together with their operations are integrated into the system in this way. The source code is available and enables the user to access and modify every part of the database system. Secondo comes with a carefully written user manual, programmer's guide and installation instructions. [1]

## Building the Container Image

See [Build](Build.md).

There are also some remarks on how the `Dockerfile` was created at [Containerization](Containerization.md).

## Obtaining the Container Image Without Building it

Using Docker [2] the Secondo image can be pulled from DockerHub [3]: 

    docker pull fischerjulian/secondo:<version>

See https://hub.docker.com/repository/docker/fischerjulian/secondo for recent versions.

## Running the Container Image

See [Run](Run.md).

## Links
1. http://dna.fernuni-hagen.de/secondo/
2. Docker, https://www.docker.com/community/open-source
3. DockerHub, https://hub.docker.com/