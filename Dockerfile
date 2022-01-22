FROM ubuntu:20.04
RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select America' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/America select Los_Angeles' | debconf-set-selections;
RUN apt -qqy update && apt -qqy upgrade 
RUN apt -qqu install --no-install-recommends tzdata
RUN apt -qqy install lsb-core
RUN apt -qqy clean && rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]
