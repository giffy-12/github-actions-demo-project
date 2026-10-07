FROM node:20-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends openssh-server rsync \
 && rm -rf /var/lib/apt/lists/* \
 && npm i -g pm2 \
 && mkdir -p /var/run/sshd \
 && useradd -m -s /bin/bash deploy && usermod -p '*' deploy \
 && mkdir -p /home/deploy/.ssh /home/deploy/app
COPY authorized_keys /home/deploy/.ssh/authorized_keys
RUN chown -R deploy:deploy /home/deploy && chmod 700 /home/deploy/.ssh \
 && chmod 600 /home/deploy/.ssh/authorized_keys \
 && sed -i 's/#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
