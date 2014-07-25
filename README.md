Dockerized wikipedia-dump-tools
====================

## Summary

Repository name in Docker Hub: **[williamyeh/wikipedia-dump-tools](https://registry.hub.docker.com/u/williamyeh/wikipedia-dump-tools/)**

This repository contains Dockerized [wikipedia-dump-tools](https://github.com/sunlightlabs/wikipedia-dump-tools) application, published to the public [Docker Hub](https://registry.hub.docker.com/) via **automated build** mechanism.





## Configuration

This docker image contains the following software stack:

- OS: Debian jessie.

- Python: 2.7.8

- wikipedia-dump-tools: Dec 05, 2013





### Dependencies

- [williamyeh/python2](https://registry.hub.docker.com/u/williamyeh/python2/).


### History

- 0.1 - Initial release.




## Installation

```
$ docker pull williamyeh/wikipedia-dump-tools
```


## Usage

Simple examples:

```
$ docker run --rm  williamyeh/wikipedia-dump-tools
```


List all command-line arguments:

```
$ docker run --rm  williamyeh/wikipedia-dump-tools  help
```



## More Info

For more info, see official [wikipedia-dump-tools](https://github.com/sunlightlabs/wikipedia-dump-tools) site.


## License

[GPL 3.0](LICENSE), same as original project.