FROM conda/miniconda3:latest

RUN apt-get update && apt-get install -y \
    git \
    make \
    gcc \ 
    g++ \
    wget

RUN pip install --no-cache-dir \
    flask
    
RUN mkdir /ODI \
&& cd /ODI \
&& mkdir ./uploaded_files \
&& git clone https://github.com/pjreddie/darknet.git \
&& cd darknet \
&& make \
&& wget https://pjreddie.com/media/files/yolov3.weights 

# COPY detection_service.py /ODI/detection_service.py

WORKDIR /ODI

CMD python detection_service.py
