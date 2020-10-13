#!/bin/bash

# Notebooks Forge script: jupyter-cmd.sh
# Notebooks Forge script description: Runs Jupyter type and specific parameters
# Notebooks Forge build Stage: Alpha
# Author: Roberto Rodriguez (@Cyb3rWard0g)
# License: GPL-3.0

NOTEBOOK_INFO_TAG="[NOTEBOOK-JUPYTER-DOCKER-INSTALLATION-INFO]"
NOTEBOOK_ERROR_TAG="[NOTEBOOK-JUPYTER-DOCKER-INSTALLATION-ERROR]"
# ***** Defining Jupyter params array **********
params=()

# **** Setting Jupyter Notebook Type ******
if [[ -z "$JUPYTER_TYPE" ]]; then
    JUPYTER_TYPE="notebook"
fi

# ***** Setting defaults and param variables ***********
# ***** If a config is passed, it should be enough ***********
if [[ "$JUPYTER_CONFIG" ]]; then
# ***** The config file to load ********
    params+=("--config=$JUPYTER_CONFIG")
else
    # ***** The IP address the notebook server will listen on*******
    if [[ -z "$JUPYTER_IP" ]]; then
        JUPYTER_IP=0.0.0.0
    fi
    params+=("--ip=$JUPYTER_IP")

    # ***** The port the notebook server will listen on *******
    if [[ -z "$JUPYTER_PORT" ]]; then
        JUPYTER_PORT=8888
    fi
    params+=("--port=$JUPYTER_PORT")

    # ***** The directory to use for notebooks and kernels *******
    if [[ -z "$JUPYTER_NOTEBOOKS_DIR" ]]; then
        JUPYTER_NOTEBOOKS_DIR=/opt/jupyter/notebooks
    fi
    params+=("--notebook-dir=$JUPYTER_NOTEBOOKS_DIR")
    # ***** Default to no browser ***********
    # Don't open the notebook in a browser after startup.
    params+=("--no-browser")

    # ***** Buffer Manager *******
    if [[ -z "$JUPYTER_MAX_BUFFER_SIZE" ]]; then
        # 0.5 GB by default
        JUPYTER_MAX_BUFFER_SIZE="536870912"
    fi
    params+=("--NotebookApp.max_buffer_size=$JUPYTER_MAX_BUFFER_SIZE")
    # ***** Running Jupyter Type & Parameters ***********
    if [[ "$JUPYTER_TYPE" == "notebook" ]]; then
        # ***** Base URL*******
        if [[ -z "$JUPYTER_BASE_URL" ]]; then
            JUPYTER_BASE_URL="/"
        fi
        params+=("--NotebookApp.base_url=$JUPYTER_BASE_URL")
    elif [[ "$JUPYTER_TYPE" == "lab" ]]; then
        # ***** Base URL*******
        if [[ -z "$JUPYTER_BASE_URL" ]]; then
            JUPYTER_BASE_URL="/"
        fi
        params+=("--LabApp.base_url=$JUPYTER_BASE_URL") 
    else
        echo "$NOTEBOOK_ERROR_TAG You did not enter a valid Jupyter type:  $JUPYTER_TYPE.."
        exit 1
    fi
fi
# ***** Running Jupyter Type & Parameters ***********
echo "$NOTEBOOK_INFO_TAG Running Jupyter Type: $JUPYTER_TYPE.."
echo "$NOTEBOOK_INFO_TAG Running the following parameters ${params[@]}"
echo "$NOTEBOOK_INFO_TAG Starting Jupyter $JUPYTER_TYPE.."
if [[ "$JUPYTER_TYPE" == "notebook" ]]; then
    jupyter notebook ${params[@]}
elif [[ "$JUPYTER_TYPE" == "lab" ]]; then
    jupyter lab ${params[@]}
fi