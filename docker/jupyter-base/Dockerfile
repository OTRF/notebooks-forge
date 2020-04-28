# Notebooks forge script: Notebooks Forge Docker Image
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0
# References:
# https://github.com/jupyter/docker-stacks/blob/master/all-spark-notebook/Dockerfile
# https://derflounder.wordpress.com/2016/07/11/editing-etcsudoers-to-manage-sudo-rights-for-users-and-groups/

FROM phusion/baseimage:0.11
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Dockerfile Notebooks Forge Base Image.."

ENV DEBIAN_FRONTEND noninteractive

USER root

# **** Set ARG Values ****
ARG JUPYTER_USER=jupyter
ARG JUPYTER_UID=810
ARG JUPYTER_GID=810

# *********** Setting Environment Variables ***************
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV JUPYTER_DIR=/opt/jupyter
ENV CONDA_DIR=/opt/conda
ENV PATH /opt/conda/bin:$PATH
# ********** Jupyter User ******
ENV USER ${JUPYTER_USER}
ENV JUPYTER_UID ${JUPYTER_UID}
ENV HOME /home/${JUPYTER_USER}
ENV JUPYTER_GID=$JUPYTER_GID

# *********** Installing Prerequisites ***************
# ********** Installing Initial Requirements ***************
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
  wget sudo nano bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 \
  git mercurial subversion unzip zip \
# ********** Adding Jupyter User **************
  && echo "auth requisite pam_deny.so" >> /etc/pam.d/su \
  # remove the sudo rights for all users with admin privileges or in admin group
  && sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers \
  && sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers \
  && groupadd -g ${JUPYTER_GID} ${JUPYTER_USER} \
  && useradd -m -s /bin/bash -u ${JUPYTER_UID} -g ${JUPYTER_GID} ${JUPYTER_USER} \
  && bash -c 'mkdir -pv /opt/jupyter/{notebooks,scripts}' \
  # ********** Clean APT **********
  && apt-get -qy clean autoremove \
  && rm -rf /var/lib/apt/lists/* \
  && chown -R ${USER} /opt ${HOME}

USER ${USER}
# *********** Install Miniconda3 ********************
# **** Current Channels ***********
#- https://repo.anaconda.com/pkgs/main/linux-64
#- https://repo.anaconda.com/pkgs/main/noarch
#- https://repo.anaconda.com/pkgs/free/linux-64
#- https://repo.anaconda.com/pkgs/free/noarch
#- https://repo.anaconda.com/pkgs/r/linux-64
#- https://repo.anaconda.com/pkgs/r/noarch
# ** Conda Issue **
# https://github.com/ContinuumIO/anaconda-issues/issues/11148
RUN mkdir /home/${USER}/.conda \
  && cd /tmp \
  && wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/anaconda.sh \
  && /bin/bash ~/anaconda.sh -b -p /opt/conda \
  && rm ~/anaconda.sh \
  && conda config --system --prepend channels conda-forge \
  && conda install --quiet --yes conda-build \
  && conda install --quiet --yes \
    'python=3.7.5' \
    'conda=4.8.3' \
    'nbconvert=5.6.1' \
    'notebook=6.0.3' \
    'jupyterhub=1.1.0' \
    'jupyterlab=2.1.1' \
    'pandas=1.0.3' \
  && conda update --all --quiet --yes \
  # *********** Installing Jupyter Extensions *****************
  && jupyter labextension install @jupyterlab/celltags \
  && rm -rf $CONDA_DIR/share/jupyter/lab/staging \
  # *********** Clean *****************
  && npm cache clean --force \
  && conda clean -tipy \
  && conda build purge-all \
  && rm -rf /home/$JUPYTER_USER/.cache/yarn

# *********** Adding HELK scripts and files to Container ***************
COPY scripts/* ${JUPYTER_DIR}/scripts/

EXPOSE 8888

# *********** RUN HELK ***************
WORKDIR ${HOME}
CMD ["/opt/jupyter/scripts/jupyter-cmd.sh"]