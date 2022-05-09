FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive 
WORKDIR "/root"
RUN apt-get update && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    apt-get install expect -y && \
    apt-get install git -y && \
    pip3 install ansible
RUN ansible-galaxy collection install ibm.ibm_zhmc && \
    pip3 install -r /root/.ansible/collections/ansible_collections/ibm/ibm_zhmc/requirements.txt && \
    ansible-galaxy collection install community.general && \
    ansible-galaxy collection install community.crypto && \
    ansible-galaxy collection install ansible.posix && \
    ansible-galaxy collection install community.libvirt && \
    ansible-galaxy install kwoodson.yedit
RUN git clone https://github.com/IBM/Ansible-OpenShift-Provisioning.git
