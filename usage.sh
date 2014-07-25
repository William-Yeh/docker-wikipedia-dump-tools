#!/bin/bash
#----------
#    Dockerized wikipedia-dump-tools
#    Copyright (C) 2014  William Yeh <william.pjyeh@gmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#----------


TIMESTAMP=`cat /var/log/DOCKER_BUILD_TIME`


cat << EOF

williamyeh/wikipedia-dump-tools - Docker image for wikipedia-dump-tools.
Image built at: $TIMESTAMP

Env
===

- Exported volumes:

    * [IN,OUT] /data - for corpus & output files.


Usage
=====

## extract plaintext from Wikipedia dump files (xml.bz2)

  Cmd:  extract-text  <input-file>  <output-file>  [log-file]

  Examples:

    # use current directory "\$(pwd)" for corpus and output.
    $ docker run --rm      \\
        -v \$(pwd):/data    \\
        williamyeh/wikipedia-dump-tools  extract-text  \
          zhwiki-latest-pages-articles.xml.bz2  zhwiki-latest-pages-articles.txt

    # ... also generate log file for diagnosis.
    $ docker run --rm      \\
        -v \$(pwd):/data    \\
        williamyeh/wikipedia-dump-tools  extract-text  \
          zhwiki-latest-pages-articles.xml.bz2  zhwiki-latest-pages-articles.txt  error.log



## List all command-line arguments:

    $ docker run --rm  \\
        williamyeh/wikipedia-dump-tools  help



More Info
=========

For more info, see official wikipedia-dump-tools site:

    https://github.com/sunlightlabs/wikipedia-dump-tools



EOF
