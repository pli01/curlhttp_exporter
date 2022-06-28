FROM debian:latest
RUN apt update -y && \
    apt upgrade -y && \
    apt install -qy curl python3 openssl \
        python3-pip \
        python3-pycurl \
        python3-urllib3 && \
    pip3 install pyopenssl pyyaml

COPY config.yml /config.yml
COPY exporter.py /exporter.py
COPY entrypoint.sh /entrypoint.sh

EXPOSE 10080

CMD ["/entrypoint.sh"]
