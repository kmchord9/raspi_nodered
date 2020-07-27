FROM node:8.17

RUN apt-get update && apt-get install -y \
    lsb-release \
    build-essential \
    git \ 
    sudo \
    libpisock-dev \
    libcap2-bin \
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* \
    #For node-red-node-sensortag
    && setcap cap_net_raw+eip $(eval readlink -f `which node`) \
    && npm i -g node-red@latest

WORKDIR /root/.node-red

RUN git clone https://github.com/kmchord9/sensor_tag.git \
    && npm i ./sensor_tag node-red-dashboard

CMD ["/bin/bash"]
