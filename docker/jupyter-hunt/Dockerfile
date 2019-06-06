# Notebooks Forge script: Jupyter Environment Dockerfile
# Notebooks Forge  Jupyter build Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.1
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Dockerfile Hunting Grounds Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

# *********** Setting Environment Variables ***************
ENV GRAPHFRAMES_VERSION=0.7.0
ENV KAFKA_VERSION=2.2.0
ENV SCALA_VERSION=2.11
ENV LZ4_JAVA=1.5.1
ENV SNAPPY_JAVA=1.1.7.3
ENV ESHADOOP_VERSION=7.1.0

USER $JUSER_UID
# **** Current Channels ***********
#- https://repo.anaconda.com/pkgs/main/linux-64
#- https://repo.anaconda.com/pkgs/main/noarch
#- https://repo.anaconda.com/pkgs/free/linux-64
#- https://repo.anaconda.com/pkgs/free/noarch
#- https://repo.anaconda.com/pkgs/r/linux-64
#- https://repo.anaconda.com/pkgs/r/noarch
RUN conda install --quiet --yes conda-build \
  # *********** Install Jupyter Notebook & Extra Packages with Conda *************
  && conda install --quiet --yes \
    'altair=3.0.1' \
    's3fs=0.2.1' \
    'elasticsearch-dsl=6.3.1' \
    'matplotlib=3.0.3' \
    'scikit-learn=0.20.3' \
    'networkx=2.3' \
    'nxviz=0.6.1' \
    # ********** R Dependencies **************
    'r-base=3.5.1' \
    'r-irkernel=0.8*' \
    'r-ggplot2=3.1*' \
    'r-sparklyr=0.9*' \
    'r-rcurl=1.95*' \
  && conda update --all --quiet --yes \
  # *********** Clean *****************
  && npm cache clean --force \
  && conda clean -tipy \
  && conda build purge-all \
  && rm -rf /home/$JUSER/.cache/yarn \
  && python3 -m pip install --upgrade pip \
  # *********** Install Pip packages not availabe via conda ************
  && python3 -m pip install ksql==0.5.1.1 confluent-kafka==1.0.0 splunk-sdk==1.6.6 Kqlmagic==0.1.97 neo4j==1.7.3 \
  # *********** Download ES-Hadoop ***************
  && wget https://artifacts.elastic.co/downloads/elasticsearch-hadoop/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip -P /opt/helk/es-hadoop/ \
  && unzip -j /opt/helk/es-hadoop/*.zip -d /opt/helk/es-hadoop/ \
  && rm /opt/helk/es-hadoop/*.zip \
  # *********** Download Graphframes Jar ***************
  && wget http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/${GRAPHFRAMES_VERSION}-spark2.4-s_2.11/graphframes-${GRAPHFRAMES_VERSION}-spark2.4-s_2.11.jar -P /opt/helk/spark/jars/ \
  && cp /opt/helk/spark/jars/graphframes* /opt/helk/spark/graphframes.zip \
  # *********** Download Extra Jars ***************
  && wget http://central.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_${SCALA_VERSION}/${SPARK_VERSION}/spark-sql-kafka-0-10_${SCALA_VERSION}-${SPARK_VERSION}.jar -P /opt/helk/spark/jars/ \
  && wget http://central.maven.org/maven2/org/apache/kafka/kafka-clients/${KAFKA_VERSION}/kafka-clients-${KAFKA_VERSION}.jar -P /opt/helk/spark/jars/ \
  && wget https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.16/slf4j-api-1.7.16.jar -P /opt/helk/spark/jars/ \
  && wget https://repo1.maven.org/maven2/org/spark-project/spark/unused/1.0.0/unused-1.0.0.jar -P /opt/helk/spark/jars/ \
  && wget https://repo1.maven.org/maven2/org/lz4/lz4-java/${LZ4_JAVA}/lz4-java-${LZ4_JAVA}.jar -P /opt/helk/spark/jars \
  && wget https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/${SNAPPY_JAVA}/snappy-java-${SNAPPY_JAVA}.jar -P /opt/helk/spark/jars/

USER root

# *********** Adding HELK scripts and files to Container ***************
COPY --chown=jupyter:810 spark/* ${SPARK_HOME}/conf/

USER ${JUSER_UID}