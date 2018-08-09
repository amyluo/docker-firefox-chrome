FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y sudo vim wget

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/gre && \
    echo "gre:x:${uid}:${gid}:gre,,,:/home/gre:/bin/bash" >> /etc/passwd && \
    echo "gre:x:${uid}:" >> /etc/group && \
    echo "gre ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/gre && \
    chmod 0440 /etc/sudoers.d/gre && \
    cp /root/.bashrc /home/gre/.bashrc && \
    cp /root/.profile /home/gre/.profile && \
    chown ${uid}:${gid} -R /home/gre


RUN apt-get update && apt-get install -y firefox

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

RUN apt-get install -y dbus-x11 packagekit-gtk3-module libcanberra-gtk-module

RUN mkdir /var/run/dbus/


USER gre
ENV HOME /home/gre
CMD sudo dbus-daemon --system --fork && /usr/bin/firefox
