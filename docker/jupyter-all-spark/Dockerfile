# Notebooks Forge script: Jupyter All Spark Environment Dockerfile
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-pyspark:0.0.6
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER root

# *********** Installing Prerequisites ***************
# -qq : No output except for errors
RUN apt-get update -qq \
  # ********** Installing R Notebooks Dependencies *********
  && apt-get install -qqy fonts-dejavu tzdata gfortran gcc \
  && ln -s /bin/tar /bin/gtar \
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/*

USER $USER
# **** Current Channels ***********
#- https://repo.anaconda.com/pkgs/main/linux-64
#- https://repo.anaconda.com/pkgs/main/noarch
#- https://repo.anaconda.com/pkgs/free/linux-64
#- https://repo.anaconda.com/pkgs/free/noarch
#- https://repo.anaconda.com/pkgs/r/linux-64
#- https://repo.anaconda.com/pkgs/r/noarch
RUN conda install --quiet --yes \
    # Installing Scala Kernel
    'spylon-kernel=0.4.1' \
    # ********** R Dependencies **************
    'r-base=3.6.1' \
    'r-irkernel=1.0.2' \
    'r-ggplot2=3.2.1' \
    'r-sparklyr=1.0.5' \
    'r-rcurl=1.95*' \
  # *********** Clean *****************
  && conda clean -tipy \
  && conda build purge-all \
  && rm -rf /home/$USER/.cache/yarn \
  && python3 -m pip install --upgrade pip \
  # *********** Install Scala Kernel *************
  && python3 -m spylon_kernel install --sys-prefix