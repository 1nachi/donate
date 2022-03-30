#Download xmrig and xmrig's cuda-plugin.
FROM alpine as dl
RUN apk update && apk add git
RUN git clone https://github.com/xmrig/xmrig.git && git clone https://github.com/xmrig/xmrig-cuda.git
#Build xmrig miner
FROM ubuntu as xmrig-builder
COPY --from=dl /xmrig /xmrig
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y build-essential cmake automake libtool autoconf wget
RUN ln -fs /usr/share/zoneinfo/Asia/Jerusalem /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata
WORKDIR /xmrig/scripts/
RUN ./build_deps.sh
WORKDIR /xmrig/build/
RUN cmake .. -DXMRIG_DEPS=scripts/deps
RUN make -j$(nproc)
#Build xmrig's cuda-plugin.
FROM nvidia/cuda:11.4.0-runtime-ubuntu20.04 as plugin-builder
COPY --from=dl /xmrig-cuda /xmrig-cuda
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y --allow-change-held-packages libcublas-11-4 build-essential cmake cuda-11-4
RUN ln -fs /usr/share/zoneinfo/Asia/Jerusalem /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata
WORKDIR /xmrig-cuda/build
RUN cmake .. -DCUDA_LIB=/usr/local/cuda/lib64/stubs/libcuda.so -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda
RUN make -j$(nproc)
#final product
FROM nvidia/cuda:11.4.0-runtime-ubuntu20.04
COPY --from=xmrig-builder /xmrig/build/xmrig /usr/local/bin
COPY --from=plugin-builder /xmrig-cuda/build/libxmrig-cuda.so /usr/local/bin
COPY config.json /usr/local/bin
