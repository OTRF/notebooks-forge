# Notebooks Forge script: Jupyter Spark Environment Dockerfile
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.3
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER root

# *********** Spark Env Variables ***************
ENV SPARK_VERSION=2.4.3
ENV APACHE_HADOOP_VERSION=2.7
ENV SPARK_HOME=/opt/jupyter/spark

# *********** Installing Prerequisites ***************
# -qq : No output except for errors
RUN apt-get update -qq \
  && apt-get install -qqy openjdk-8-jre-headless ca-certificates-java \
  # ********** Installing R Notebooks Dependencies *********
  fonts-dejavu tzdata gfortran gcc \
  && ln -s /bin/tar /bin/gtar \
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/* \
  # *********** Installing Spark ***************
  && bash -c 'mkdir -pv /opt/jupyter/spark/logs' \
  && wget -qO- http://mirror.reverse.net/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${APACHE_HADOOP_VERSION}.tgz | sudo tar xvz -C ${SPARK_HOME} --strip-components=1 \
  && chown -R ${USER} ${JUPYTER_DIR} ${HOME}

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
    'r-base=3.5.1' \
    'r-irkernel=0.8*' \
    'r-ggplot2=3.1*' \
    'r-sparklyr=0.9*' \
    'r-rcurl=1.95*' \
  # *********** Clean *****************
  && conda clean -tipy \
  && conda build purge-all \
  && rm -rf /home/$USER/.cache/yarn \
  && python3 -m pip install --upgrade pip \
  # *********** Install Scala Kernel *************
  && python3 -m spylon_kernel install --sys-prefix

# *********** Adding HELK scripts and files to Container ***************
COPY spark/* ${SPARK_HOME}/conf/
COPY kernels/pyspark_kernel.json /usr/local/share/jupyter/kernels/pyspark3/kernel.json

USER root

RUN chown -R ${USER} ${JUPYTER_DIR} ${HOME} \
  && chown ${USER} /usr/local/share/jupyter/kernels/pyspark3/kernel.json

EXPOSE 8000

USER ${USER}