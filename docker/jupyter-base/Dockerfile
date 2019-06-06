# Hunting Grounds script: Jupyter Environment Dockerfile
# Hunting Grounds Jupyter build Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0
# References:
# https://github.com/jupyter/docker-stacks/blob/master/all-spark-notebook/Dockerfile

FROM cyb3rward0g/helk-spark-base:2.4.3
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Dockerfile Hunting Grounds Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER root

# *********** Setting Environment Variables ***************
ENV CONDA_VERSION=4.6.7
ENV POSTGRESQL_VERSION=42.2.5
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV JUPYTER_DIR=/opt/helk/jupyter
ENV CONDA_DIR=/opt/conda
ENV PATH /opt/conda/bin:$PATH
ENV JUSER_GID=810
ENV JUSER_UID=810
ENV JUSER=jupyter

# ********** Adding Jupyter User **************
RUN groupadd -g ${JUSER_GID} ${JUSER} \
  && useradd -m -s /bin/bash -u ${JUSER_UID} -g ${JUSER_GID} ${JUSER} \
  && bash -c 'mkdir -pv /opt/helk/{es-hadoop,jupyter/notebooks,jupyterhub}' \
  && chown -R ${JUSER}:${JUSER_GID} /opt ${JUPYTER_DIR} \
  # ********** Installing Initial Requirements ***************
  && apt-get update --fix-missing && apt-get install -y --no-install-recommends \
  wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion \
  unzip zip postgresql postgresql-contrib \
  # ********** Installing R Notebooks Dependencies *********
  fonts-dejavu tzdata gfortran gcc \
  && ln -s /bin/tar /bin/gtar \
  # ********** Clean APT **********
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/*

USER $JUSER_UID
# *********** Install Miniconda3 ********************
# **** Current Channels ***********
#- https://repo.anaconda.com/pkgs/main/linux-64
#- https://repo.anaconda.com/pkgs/main/noarch
#- https://repo.anaconda.com/pkgs/free/linux-64
#- https://repo.anaconda.com/pkgs/free/noarch
#- https://repo.anaconda.com/pkgs/r/linux-64
#- https://repo.anaconda.com/pkgs/r/noarch
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/anaconda.sh \
  && /bin/bash ~/anaconda.sh -b -p /opt/conda \
  && rm ~/anaconda.sh \
  && conda config --system --prepend channels conda-forge \
  && conda install --quiet --yes conda-build \
  # *********** Install Jupyter Notebook & Extra Packages with Conda *************
  && conda install --quiet --yes \
    'python=3.7' \
    'conda=4.6.14' \
    'nbconvert=5.5.0' \
    'notebook=5.7.8' \
    'jupyterhub=1.0.0' \
    'jupyterlab=0.35.6' \
    'pandas=0.24.2' \
    'spylon-kernel=0.4.1' \
  && conda update --all --quiet --yes \
  # *********** Installing Jupyter Extensions *****************
  && jupyter labextension install @jupyterlab/hub-extension@0.12.0 \
  && jupyter labextension install @jupyterlab/celltags@0.1.4 \
  && jupyter labextension install @mflevine/jupyterlab_html@0.1.4 \
  && jupyter labextension install @jupyter-widgets/jupyterlab-manager@0.38.1 \
  && rm -rf $CONDA_DIR/share/jupyter/lab/staging \
  # *********** Clean *****************
  && npm cache clean --force \
  && conda clean -tipy \
  && conda build purge-all \
  && rm -rf /home/$JUSER/.cache/yarn \
  # *********** Install Scala Kernel *************
  && python3 -m spylon_kernel install --sys-prefix \
  # ********** Download Postgresql JAR *****************
  && wget https://jdbc.postgresql.org/download/postgresql-${POSTGRESQL_VERSION}.jar -P /opt/helk/spark/jars/ \
  && mkdir -v /opt/helk/spark/log

USER root

# *********** Adding HELK scripts and files to Container ***************
COPY --chown=jupyter:810 scripts/* ${JUPYTER_DIR}/
COPY --chown=jupyter:810 spark/* ${SPARK_HOME}/conf/
COPY --chown=jupyter:810 kernels/pyspark_kernel.json /usr/local/share/jupyter/kernels/pyspark3/kernel.json

RUN chown jupyter /run/postgresql

EXPOSE 8888 8000
# *********** RUN HELK ***************
WORKDIR ${JUPYTER_DIR}
ENTRYPOINT ["./jupyter-entrypoint.sh"]
CMD ["./jupyter-cmd.sh"]

USER ${JUSER_UID}