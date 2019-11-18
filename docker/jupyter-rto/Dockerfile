# Notebooks Forge script: Jupyter RTO Dockerfile
# Notebooks Forge Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.5
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER ${USER}

RUN python3 -m pip install --upgrade pip \
  # *********** Install neo4j ************
  && python3 -m pip install neo4j==1.7.6 \
  # *********** Download pycobalt ***************
  && mkdir -p /opt/pycobalt \
  && git clone https://github.com/dcsync/pycobalt.git /opt/pycobalt \
  && cd /opt/pycobalt \
  && python3 setup.py install \
  # *********** Download Faction C2 Client ***************
  && mkdir -pv /opt/faction/cli \
  && git clone --single-branch --branch=master https://github.com/FactionC2/CLI /opt/faction/cli \
  && cd /opt/faction/cli \
  && python3 -m pip install pipenv \
  && python3 -m pipenv install --system \
  && python3 setup.py install