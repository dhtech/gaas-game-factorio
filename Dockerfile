# Thanks to OpenSourceLAN/gameservers-docker for the base!
FROM ubuntu:latest

RUN useradd factorio
RUN apt-get update && apt-get install wget xz-utils jq -y
RUN wget https://www.factorio.com/get-download/0.17.49/headless/linux64
RUN mv linux64 linux64.tar.xz
RUN tar -xvf linux64.tar.xz -C /
RUN mkdir -p /factorio/saves && chown -R factorio:factorio /factorio
RUN chown -R factorio:factorio /factorio
WORKDIR /factorio
ADD start-*.sh /factorio/
USER factorio

CMD ["/factorio/start-factorio.sh"]
