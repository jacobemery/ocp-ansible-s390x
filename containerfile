FROM registry.access.redhat.com/ubi8/ubi-minimal AS base
RUN microdnf install python38 shadow-utils \
    && groupadd -g 4173 ocpz \
    && useradd -u 4173 -g ocpz -G root -s /bin/bash ocpz \
    && chgrp -R root /home/ocpz /etc/passwd \
    && chmod -R g=u /home/ocpz /etc/passwd \
    && microdnf remove shadow-utils \
    && microdnf clean all
WORKDIR /home/ocpz
RUN microdnf upgrade \
  --refresh \
  --best \
  --nodocs \
  --noplugins \
  --setopt=install_weak_deps=0

RUN microdnf install python3-pip openssh expect git vsftpd httpd -y \
    pip3 install ansible
RUN ansible-galaxy collection install ibm.ibm_zhmc && \
    pip3 install -r /root/.ansible/collections/ansible_collections/ibm/ibm_zhmc/requirements.txt && \
    ansible-galaxy collection install community.general && \
    ansible-galaxy collection install community.crypto && \
    ansible-galaxy collection install ansible.posix && \
    ansible-galaxy collection install community.libvirt && \
    ansible-galaxy install kwoodson.yedit

