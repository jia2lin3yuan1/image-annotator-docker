FROM nvidia/cudagl:9.0-runtime-ubuntu16.04

# Add some metadata to describe our container
LABEL maintainer="Nicholas Kiddle"
LABEL maintainer_email="kiddlen@oregonstate.edu"
LABEL version="0.0.1"

### Moving initial files into position 
COPY ./image-annotator /image-annotator
COPY ./cudnn-9.0-linux-x64-v7.1.tgz / 

### Updating Ubuntu Packages
RUN apt-get update && yes|apt-get upgrade
RUN apt-get install -y wget bzip2
RUN apt-get install -y libsm6 libxext6 libxrender-dev
# Add sudo
RUN apt-get -y install sudo
# Add user ubuntu with no password, add to sudo group
RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu/
RUN chmod a+rwx /home/ubuntu/

### Install cudnn 7.1.4 for tensorflow-gpu 1.12.0
RUN tar -xzvf /cudnn-9.0-linux-x64-v7.1.tgz
RUN sudo mkdir /usr/local/cuda/include
RUN sudo cp cuda/include/cudnn.h /usr/local/cuda/include
RUN sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
RUN sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

### Install Anaconda 
RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

### Set path to conda
ENV PATH /home/ubuntu/anaconda3/bin:$PATH

### Getting python dependencies set for Image Annotator
RUN conda install python=3.6
RUN pip install--upgrade pip
RUN pip install flask pillow easydict opencv-python scipy waitress tensorflow-gpu==1.12.0

### Forward port 5000 from within docker container to outside docker container
EXPOSE 5000

ENTRYPOINT ["python", "/image-annotator/grabcut.py"]
