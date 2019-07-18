# Notebooks Forge script: Jupyter RTO Dockerfile
# Notebooks Forge Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.3
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Dockerfile Hunting Grounds Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER ${USER}

RUN python3 -m pip install --upgrade pip \
  # *********** Install Pip packages not availabe via conda ************
  && python3 -m pip install neo4j==1.7.3 \
  # *********** Download pycobalt ***************
  && cd /opt/helk/ \
  && git clone https://github.com/dcsync/pycobalt.git \
  && cd pycobalt \
  && python3 setup.py install