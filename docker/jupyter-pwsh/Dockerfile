# Notebooks Forge script: Jupyter Powershell Dockerfile
# Notebooks Forge Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.5
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN curl -sLO https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
  && dpkg -i packages-microsoft-prod.deb \
  && apt-get update --fix-missing \
  && apt-get install -y --no-install-recommends powershell \
  # ********** Clean APT **********
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/*

USER ${USER}

RUN python3 -m pip install --upgrade pip \
  # *********** Install powershell kernel ************
  && python3 -m pip install powershell-kernel==0.1.2 \
  && python3 -m powershell_kernel.install --powershell-command pwsh