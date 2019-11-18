# Notebooks Forge script: Jupyter Hunt Environment Dockerfile
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-pyspark:0.0.3
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

# *********** Setting Environment Variables ***************
ENV GRAPHFRAMES_VERSION=0.7.0
ENV KAFKA_VERSION=2.3.1
ENV SCALA_VERSION=2.11
ENV SLF4J_API_VERSION=1.7.29
ENV LZ4_JAVA=1.6.0
ENV SNAPPY_JAVA=1.1.7.3
ENV ESHADOOP_VERSION=7.4.2
ENV ESHADOOP_DIR=${JUPYTER_DIR}/es-hadoop

USER $USER
# **** Current Channels ***********
#- https://repo.anaconda.com/pkgs/main/linux-64
#- https://repo.anaconda.com/pkgs/main/noarch
#- https://repo.anaconda.com/pkgs/free/linux-64
#- https://repo.anaconda.com/pkgs/free/noarch
#- https://repo.anaconda.com/pkgs/r/linux-64
#- https://repo.anaconda.com/pkgs/r/noarch
RUN mkdir -v ${ESHADOOP_DIR} \
  # *********** Install Jupyter Notebook & Extra Packages with Conda *************
  && conda install --quiet --yes \
    'altair=3.2.0' \
    's3fs=0.4.0' \
    'elasticsearch-dsl=7.0.0' \
    'matplotlib=3.1.2' \
    'networkx=2.4' \
    'nxviz=0.6.1' \
  && conda update --all --quiet --yes \
  # *********** Clean *****************
  && conda clean -tipy \
  && conda build purge-all \
  && rm -rf /home/$USER/.cache/yarn \
  # *********** Install Pip packages not availabe via conda ************
  && python3 -m pip install ksql==0.5.1.1 confluent-kafka==1.2.0 splunk-sdk==1.6.11 Kqlmagic==0.1.107.post1 neo4j==1.7.6 openhunt==1.6.4 pyarrow==0.15.1 msticpy==0.2.7 \
  # *********** Download ES-Hadoop ***************
  && wget https://artifacts.elastic.co/downloads/elasticsearch-hadoop/elasticsearch-hadoop-${ESHADOOP_VERSION}.zip -P ${ESHADOOP_DIR}/ \
  && unzip -j ${ESHADOOP_DIR}/*.zip -d ${ESHADOOP_DIR}/ \
  && rm ${ESHADOOP_DIR}/*.zip \
  # *********** Download Graphframes Jar ***************
  && wget http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/${GRAPHFRAMES_VERSION}-spark2.4-s_2.11/graphframes-${GRAPHFRAMES_VERSION}-spark2.4-s_2.11.jar -P ${SPARK_HOME}/jars/ \
  && cp ${SPARK_HOME}/jars/graphframes* ${SPARK_HOME}/graphframes.zip \
  # *********** Download Extra Jars ***************
  && wget http://central.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_${SCALA_VERSION}/${SPARK_VERSION}/spark-sql-kafka-0-10_${SCALA_VERSION}-${SPARK_VERSION}.jar -P ${SPARK_HOME}/jars/ \
  && wget http://central.maven.org/maven2/org/apache/kafka/kafka-clients/${KAFKA_VERSION}/kafka-clients-${KAFKA_VERSION}.jar -P ${SPARK_HOME}/jars/ \
  && wget https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SLF4J_API_VERSION}/slf4j-api-${SLF4J_API_VERSION}.jar -P ${SPARK_HOME}/jars/ \
  && wget https://repo1.maven.org/maven2/org/spark-project/spark/unused/1.0.0/unused-1.0.0.jar -P ${SPARK_HOME}/jars/ \
  && wget https://repo1.maven.org/maven2/org/lz4/lz4-java/${LZ4_JAVA}/lz4-java-${LZ4_JAVA}.jar -P ${SPARK_HOME}/jars \
  && wget https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/${SNAPPY_JAVA}/snappy-java-${SNAPPY_JAVA}.jar -P ${SPARK_HOME}/jars/

# *********** Adding HELK scripts and files to Container ***************
COPY spark/* ${SPARK_HOME}/conf/

USER root

RUN chown -R ${USER} ${JUPYTER_DIR} ${HOME} ${SPARK_HOME}

USER ${USER}