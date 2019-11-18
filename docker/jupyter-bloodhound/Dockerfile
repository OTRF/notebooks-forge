# Notebooks Forge script: Jupyter Bloodhound Dockerfile
# Notebooks Forge Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

FROM cyb3rward0g/jupyter-base:0.0.5
LABEL maintainer="Roberto Rodriguez @Cyb3rWard0g"
LABEL description="Notebooks Forge Jupyter Project."

ENV DEBIAN_FRONTEND noninteractive

USER ${USER}

RUN python3 -m pip install --upgrade pip \
  # *********** Install Libraries ************
  && python3 -m pip install py2neo==4.3.0 plotly==4.3.0 altair==3.2.0 ipywidgets==7.5.1 \
  # *********** Install Extensions *******************
  # Jupyter widgets extension
  && jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1 \
  # jupyterlab renderer support
  && jupyter labextension install jupyterlab-plotly@1.3.0 --no-build \
  # FigureWidget support
  && jupyter labextension install plotlywidget@1.3.0 --no-build \
  # Build extensions (must be done to activate extensions since --no-build is used above)
  && jupyter lab build --minimize=False --dev-build=False