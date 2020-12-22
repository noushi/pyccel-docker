# using latest ubuntu lts
FROM ubuntu 

RUN  apt-get update && \
     apt-get install -y gcc  && \
     apt-get install -y gfortran  && \
     apt-get install -y libblas-dev liblapack-dev  && \
     apt-get install -y libopenmpi-dev openmpi-bin

ENV PYTHON=python3 #PYTHON=python3.8

RUN apt-get install -y $PYTHON $PYTHON-pip

COPY requirements.txt /opt

RUN pip3 install -r /opt/requirements.txt
