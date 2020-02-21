# image-annotator-docker
Requirements:
- Image Annotator files to be placed in image-annotator-docker/
- cuDNN 7.1.4 to be placed in image-annotator-docker/ 
  - https://developer.nvidia.com/rdp/cudnn-archive
  - Select "Download cuDNN v7.1.4 (May 16, 2018), for CUDA 9.0"
  - Download "cuDNN v7.1.4 Library for Linux"
- Docker to be installed on host machine
- nvidia-docker (2.0) installed on host machine
  - https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)
- Host system with NVIDIA GPU
- Host system with internet connection

Build and Run:
1. $ ./start_img_ann
2. Open browser to 0.0.0.0:5000/
