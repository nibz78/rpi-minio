FROM armhf/alpine:latest
WORKDIR /root/
RUN apk add --update curl ca-certificates &&  \
    curl -sSLO https://dl.minio.io/server/minio/release/linux-arm/minio && \
    mv minio /usr/bin/

EXPOSE 9000
RUN chmod +x /usr/bin/minio

CMD ["/usr/bin/minio","--config-dir", "/data/etc/minio" ,"server", "/data/objects/"]
