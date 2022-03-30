#Build xmrig
FROM alpine as builder
RUN apk add git make cmake libstdc++ gcc g++ automake libtool autoconf linux-headers
RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir xmrig/build
WORKDIR /xmrig/scripts
RUN sh build_deps.sh
WORKDIR /xmrig/build
RUN cmake .. -DXMRIG_DEPS=scripts/deps -DBUILD_STATIC=ON
RUN make -j$(nproc)
#Final product


FROM alpine
COPY --from=builder /xmrig/build/xmrig /usr/bin
COPY config.json /usr/bin
