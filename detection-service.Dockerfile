FROM conda/miniconda3:latest

RUN conda install tensorflow-gpu

RUN apt-get update && apt-get install -y \
    git \
    make \
    gcc \ 
    g++ \
    wget
    
RUN pip install --upgrade pip && pip install --no-cache-dir \
    flask 

RUN mkdir /DLI \
&& cd /DLI \
&& mkdir ./uploaded_files \
&& git clone https://github.com/pjreddie/darknet.git \
&& cd darknet \
&& make \
&& wget https://pjreddie.com/media/files/yolov3.weights 

# COPY detection_service.py /DLI/detection_service.py

WORKDIR /DLI

CMD python detection_service.py
