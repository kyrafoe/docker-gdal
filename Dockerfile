FROM python:3.6

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update
RUN apt-get -y install apt-utils vim make build-essential git
RUN python3 -m pip install --upgrade pip
RUN apt-get install -y binutils libproj-dev


#install requirements
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN apt-get install -y gdal-bin
RUN ogrinfo --version
RUN apt-get install -y libgdal-dev
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal
RUN pip3 install GDAL==3


