# using latest ubuntu lts
FROM ubuntu 

RUN  apt-get update && \
     apt-get install -y gcc  && \
     apt-get install -y gfortran  && \
     apt-get install -y libblas-dev liblapack-dev  && \
     apt-get install -y libopenmpi-dev openmpi-bin

ENV PYTHON=python3 #PYTHON=python3.8

RUN apt-get install -y $PYTHON $PYTHON-pip

RUN apt-get install -y git

COPY requirements.txt /opt

ENV LC_CTYPE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LC_ALL=C.UTF-8

RUN pip3 install -r /opt/requirements.txt
