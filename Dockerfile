FROM debian:stable-slim
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
COPY ./mosdns-x /usr/bin/

RUN chmod +x /usr/bin/mosdns-x
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/* && mkdir /etc/mosdns-x

CMD /usr/bin/mosdns-x start --dir /etc/mosdns-x