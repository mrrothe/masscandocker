FROM debian:bookworm as build

WORKDIR /masscan/src

RUN apt update
RUN apt install -y git build-essential
RUN git clone https://github.com/robertdavidgraham/masscan /masscan/src
RUN make -j

FROM debian:bookworm
RUN apt update
RUN apt install -y libpcap-dev
COPY --from=build /masscan/src/bin/masscan /usr/local/bin/masscan
ENTRYPOINT  ["/usr/local/bin/masscan"]

