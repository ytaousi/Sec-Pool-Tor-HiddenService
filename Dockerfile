FROM debian:buster

EXPOSE 80 22

RUN apt update && apt upgrade -y && apt install -y vim nginx wget tor curl ssh

COPY ./confs/nginx.conf /etc/nginx/sites-enabled/default
COPY ./confs/index.html /var/www/html/index.html
COPY ./confs/torrc /etc/tor/torrc
# COPY ./confs/sshd_config /etc/ssh/sshd_config

COPY ./confs/setupServices.sh /setupServices.sh
RUN chmod +x /setupServices.sh

ENTRYPOINT [ "/bin/bash", "/setupServices.sh" ]