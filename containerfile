FROM registry.access.redhat.com/ubi8/ubi-minimal AS base
#RUN microdnf install shadow-utils \
#    && groupadd -g 4173 ocpz \
#    && useradd -u 4173 -g ocpz -G wheel -s /bin/bash ocpz \
#    && chgrp -R wheel /home/ocpz /etc/passwd \
#    && chmod -R g=u /home/ocpz /etc/passwd \
#    && microdnf remove shadow-utils \
#    && microdnf clean all
#RUN microdnf install nano openssh
#RUN microdnf install python3-pip 
#USER ocpz
#WORKDIR /home/ocpz
#RUN pip3 install ansible --user