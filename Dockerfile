# wikipedia-dump-tools for Debian jessie
#
# URL: https://github.com/William-Yeh/docker-wikipedia-dump-tools
#
# Reference: https://github.com/sunlightlabs/wikipedia-dump-tools
#
# Version     0.1
#

# pull base image
FROM williamyeh/python2
MAINTAINER William Yeh <william.pjyeh@gmail.com>

ENV TARBALL https://github.com/sunlightlabs/wikipedia-dump-tools/archive/master.zip


RUN apt-get update

# Install curl & helper tools
RUN apt-get install -y -q --no-install-recommends curl unzip


RUN mkdir -p /opt/wikipedia-dump-tools

# download & compile
RUN \
    cd /tmp  && \
    curl -OL $TARBALL  && \
    unzip *.zip  && \
    mv wikipedia-dump-tools-master/*  /opt/wikipedia-dump-tools/  && \
    cd /opt/wikipedia-dump-tools  && \
    sed -i -e 's/^import sys$/import sys\nreload(sys)\nsys.setdefaultencoding("utf8")\n/' wikitools/pageprocessor.py  && \
    apt-get install --no-install-recommends -y -q libxml2-dev libxslt1-dev zlib1g-dev  && \
    pip install lxml functional inflect  && \
    python setup.py install


# Uninstall curl & help tools
RUN apt-get remove -y --auto-remove curl unzip && \
    apt-get clean

# clean up
RUN rm -rf /tmp/*

#----------------------------#

# configure
VOLUME [ "/data" ]
WORKDIR /data


# for convenience
ENV TOOLS_PATH   /opt/wikipedia-dump-tools
ENV PATH $TOOLS_PATH:$PATH
COPY usage.sh       /opt/wikipedia-dump-tools/
COPY help           /opt/wikipedia-dump-tools/
COPY extract-text   /opt/wikipedia-dump-tools/
RUN date '+%Y-%m-%dT%H:%M:%S%:z' > /var/log/DOCKER_BUILD_TIME


# Define default command.
CMD ["usage.sh"]

