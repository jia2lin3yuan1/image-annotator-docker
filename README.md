# image-annotator-docker
Requirements (for Ubuntu 16.04):
- Host system with NVIDIA GPU
- Host system with internet connection

- git clone this repository

- Image Annotator files to be placed in image-annotator-docker/
  - Just clone from this repository (no install needed) https://bitbucket.org/JialinYuan/image-annotator/src/master/
  - Download and extract model.zip to /image-annotator-docker/image-annotator/deep_interactive/
    - https://oregonstate.box.com/s/dq4tc94f1299lml52a7bh7dztjkhvrj5

- Modify image-annotator-docker/image-annotator/config.py
  - find line: `__C.PosNeg_Model_weight_Path = './deep_interactive/model/PASCAL/pos_neg/model.ckpt-80000'` and change it to: `__C.PosNeg_Model_weight_Path = '/deep_interactive/model/PASCAL/pos_neg/model.ckpt-80000`

  
- cuDNN 7.1.4 and place "cudnn-9.0-linux-x64-v7.1.tgz" in image-annotator-docker/ 
  - https://developer.nvidia.com/rdp/cudnn-archive
  - Select "Download cuDNN v7.1.4 (May 16, 2018), for CUDA 9.0"
  - Download "cuDNN v7.1.4 Library for Linux"

- Docker to be installed on host machine
  - https://docs.docker.com/engine/install/ubuntu/
  - Complete postinstall steps: https://docs.docker.com/engine/install/linux-postinstall/

- nvidia-docker (2.0) installed on host machine
  - https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)

Build and Run:
1. $ `./start_img_ann`
2. Open browser to 0.0.0.0:5000/
