# Secondo Container Image

## About Secondo

> Secondo is an extensible database system supporting especially non-standard applications. Designed at the FernUniversität in Hagen, Secondo is a platform for implementing and experimenting with various kinds of data models. [1]

> The Secondo system is extensible by algebra modules, using a well defined interface. New data models and data structures together with their operations are integrated into the system in this way. The source code is available and enables the user to access and modify every part of the database system. Secondo comes with a carefully written user manual, programmer's guide and installation instructions. [1]

## Building the Container Image

The image can be build by using:

    docker image build -t secondo:<version> .

Where `<version>` is of the form `major.minor.patchlevel` such as `4.2.0.6`:

    docker image build -t secondo:4.2.0.6 .

There are also some remarks on how the `Dockerfile` was created at [Containerization](Containerization.md).

## Publish to DockerHub

In order to publish the local image to the DockerHub [3] container registry first tag the local image:

    docker tag secondo:4.2.0.6 secondodb/secondo:4.2.0.6

Then push it:

    docker push secondodb/secondo:4.2.0.6

Which will upload it to the registry.

## Obtaining the Container Image Without Building it

Using Docker [2] the Secondo image can be pulled from DockerHub [3]: 

    docker pull secondodb/secondo:<version>

See https://hub.docker.com/repository/docker/secondodb/secondo for recent versions.

## Running the Container Image

In order to run the container execute:

    docker container run -it --name secondo --mount source=secondo-databases,target=/database/secondo-databases -p 1234:1234 secondo:<version>

For more details see [Run](Run.md).

## Links
1. http://dna.fernuni-hagen.de/secondo/
2. Docker, https://www.docker.com/community/open-source
3. DockerHub, https://hub.docker.com/