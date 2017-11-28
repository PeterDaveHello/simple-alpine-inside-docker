FROM alpine:edge

RUN sed -i 's/dl-cdn.alpinelinux.org/ftp.yzu.edu.tw/g' /etc/apk/repositories
RUN apk add -U bash git openssh rsync vim htop vnstat glances curl wget mtr tree ca-certificates openssl ncurses coreutils python2 make gcc g++ libgcc linux-headers grep util-linux binutils findutils procps mosh aria2 sudo bash-completion iperf tmux unzip jq docker unrar xz

RUN ln -s /bin/touch /usr/bin/touch
RUN ln -sf /bin/free /usr/bin/free
RUN sed -i 's/\/bin\/ash/\/bin\/bash/g' /etc/passwd

RUN /usr/bin/ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
