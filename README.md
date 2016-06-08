---
# swarmkit-builder
---
A Docker container for building swarmkit (https://github.com/docker/swarmkit), based on golang 1.6.2 image.

## Getting started (from Docker Hub)
```
$ mkdir output
$ docker run -it --rm -v $(pwd)/output:/output matsca09/swarmkit-builder 
```
Binaries will be in output/ directory and the container will remove itself after the build :D

__WARNING:__ as compiling process does NOT run as root user (a "builder" user is present and used) in the container, you may need to set permissions for the volume; for Fedora 23 I've used:
```
$ docker run -it --rm -v $(pwd)/output:/output:Z matsca09/swarmkit-builder
```

__ENJOY :)__
___
