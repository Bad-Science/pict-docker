# pict-docker

Unofficial Dockerfile for the Pict Programming Language

Usage:

  `$ docker run -it datamouse/pict`

  `$ pict pict-4.1/Examples/Simple/hello.pi`


To easily run / sync code from the host machine:

  `$ docker run -it -v <~/path/to/code/folder>:/root/src datamouse/pict`

  `$ pict src/<my_pict_file>.pi`

(this -v syntax works on Mac OS, see https://docs.docker.com/engine/tutorials/dockervolumes/ for Linux, Windows as the volume syntax is slightly different)

See http://www.cis.upenn.edu/~bcpierce/papers/pict/Html/Pict.html for more information about Pict.

Available on docker hub https://hub.docker.com/r/datamouse/pict/.
