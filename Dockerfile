FROM ubuntu:20.04
RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select America' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/America select Los_Angeles' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends tzdata \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN apt -qqy update && apt -qqy upgrade
RUN apt -qqy install lsb-core
CMD ["/bin/bash"]
