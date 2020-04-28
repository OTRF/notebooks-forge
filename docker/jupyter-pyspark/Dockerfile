# Notebooks Forge script: Jupyter PySpark Environment Dockerfile
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.6
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER root

# *********** Spark Env Variables ***************
ENV SPARK_VERSION=2.4.5
ENV APACHE_HADOOP_VERSION=2.7
ENV SPARK_HOME=/opt/jupyter/spark

# *********** Installing Prerequisites ***************
# -qq : No output except for errors
RUN apt-get update -qq \
  && apt-get install -qqy openjdk-8-jre-headless ca-certificates-java \
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/* \
  # *********** Installing Spark ***************
  && bash -c 'mkdir -pv /opt/jupyter/spark/logs' \
  && wget -c http://apache.claz.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${APACHE_HADOOP_VERSION}.tgz -O - | tar xvz -C ${SPARK_HOME} --strip-components=1 \
  && chown -R ${USER} ${JUPYTER_DIR} ${HOME}

USER ${USER}

# Downgrade Python (Spark does not work well with 3.8)
RUN conda install --quiet --yes \
    'python=3.7.6' \
    && conda clean -tipy \
    && conda build purge-all

USER root
# *********** Adding scripts and files to Container ***************
COPY spark/* ${SPARK_HOME}/conf/
COPY kernels/pyspark_kernel.json /usr/local/share/jupyter/kernels/pyspark3/kernel.json

RUN chown -R ${USER} ${JUPYTER_DIR} ${HOME} ${SPARK_HOME} \
  && chown ${USER} /usr/local/share/jupyter/kernels/pyspark3/kernel.json

EXPOSE 8000

USER ${USER}