# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-pyspark:0.0.6
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project"

ENV DEBIAN_FRONTEND noninteractive

# *********** Setting Environment Variables ***************
ENV GRAPHFRAMES_VERSION=0.8.0
ENV SPARK_GF_VERSION=3.0
ENV SCALA_GF_VERSION=2.12

USER $USER
# *********** Download Graphframes Jar ***************
RUN wget http://dl.bintray.com/spark-packages/maven/graphframes/graphframes/${GRAPHFRAMES_VERSION}-spark${SPARK_GF_VERSION}-s_${SCALA_GF_VERSION}/graphframes-${GRAPHFRAMES_VERSION}-spark${SPARK_GF_VERSION}-s_${SCALA_GF_VERSION}.jar -P ${SPARK_HOME}/jars/ \
  && cp ${SPARK_HOME}/jars/graphframes* ${SPARK_HOME}/graphframes.zip