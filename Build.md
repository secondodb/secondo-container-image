# Building the Image

This document provides a brief overview on how to build the Secondo image.

## Build

The image can be build by using:

    docker image build -t secondo:<version> .

Where `<version>` is of the form `major.minor.patchlevel` such as `0.4.0`:

    docker image build -t secondo:0.4.0 .

## Publish

    docker tag secondo:0.4.0 fischerjulian/secondo:0.4.0
    docker push fischerjulian/secondo:0.4.0