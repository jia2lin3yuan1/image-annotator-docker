# image-annotator-docker
Requirements (for Ubuntu 16.04):
- Host system with NVIDIA GPU
- Host system with internet connection

- git clone this repository

- Image Annotator files to be placed in image-annotator-docker/
  - https://bitbucket.org/JialinYuan/image-annotator/src/master/
  - Move directory image-annotator-docker/model/ to /image-annotator-docker/image-annotator/deep_interactive/
  
- cuDNN 7.1.4 and place "cudnn-9.0-linux-x64-v7.1.tgz" in image-annotator-docker/ 
  - https://developer.nvidia.com/rdp/cudnn-archive
  - Select "Download cuDNN v7.1.4 (May 16, 2018), for CUDA 9.0"
  - Download "cuDNN v7.1.4 Library for Linux"

- Docker to be installed on host machine
  - https://docs.docker.com/engine/install/ubuntu/

- nvidia-docker (2.0) installed on host machine
  - https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)

Build and Run:
1. $ ./start_img_ann
2. Open browser to 0.0.0.0:5000/
