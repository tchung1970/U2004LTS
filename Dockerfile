FROM ubuntu:20.04
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install lsb-core
CMD ["/bin/bash"]
