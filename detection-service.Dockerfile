FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    git \
    make \
    gcc \ 
    g++ \
    wget
    
RUN mkdir /ODI \
&& cd /ODI \
&& git clone https://github.com/pjreddie/darknet.git \
&& cd darknet \
&& make \
&& wget https://pjreddie.com/media/files/yolov3.weights 