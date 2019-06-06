Docker Notebook Deployments
===========================

Docker technology allows the project to package notebook applications with all its libraries and dependencies in "containers" and make them portable among any operating system.
This allows security analytst to deploy the notebook servers on any system they use daily for hunting research.

What are Docker Containers?
###########################

According to `Docker docs <https://www.docker.com/resources/what-container>`_, a container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.
A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

.. image:: _static/docker-containers.png
    :alt: Docker Containers
    :scale: 50%

There are two notebook environments being supported by the project.

Jupyter Notebooks Install
#########################

Requirements
************

* `Git <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>`_ : Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
* `Docker CE <https://docs.docker.com/install/>`_ : Docker Community Edition (CE) is ideal for developers and small teams looking to get started with Docker and experimenting with container-based apps.
* `Docker Compose <https://docs.docker.com/compose/>`_ : a tool for defining and running multi-container Docker applications.

Steps
*****

Git clone the `Notebooks Forge project <https://github.com/Cyb3rWard0g/notebooks-forge>`_ and change your current directory to the projects directory. 

.. code-block:: console

    $ git clone https://github.com/Cyb3rWard0g/notebooks-forge.git
    $ cd notebooks-forge/

Change your current directory to the specific notebook you want to work with (``jupyter-hunt`` or ``jupyter-rto``)

.. code-block:: console

    $ cd jupyter-hunt/

Run docker-compose pointing to the default compose file available in the folder.

.. code-block:: console

    $ sudo docker-compose -f docker-compose.yml up --buil -d

Once your container gets downloaded/run, you can check it if is running or not with the following commands:

.. code-block:: console

    $ sudo docker ps

Before accessing the Jupyter notebook server via your favorite web browser, you will have to get the access token the application initialized with.
You can get it with the following command:

.. code-block:: console

    $ sudo docker exec -ti jupyter-hunt jupyter notebook list | grep "token" | sed 's/.*token=\([^ ]*\).*/\1/'

Open your favorite browser at ``http://<notebook IP address>:8888```. You will then be prompted with a login box to enter the token.

.. image:: _static/jupyter-login.png
    :alt: Jupyter Login
    :scale: 50%

That's it! You are now ready to use your Jupyter Notebook server.

.. image:: _static/jupyter-main.png
    :alt: Jupyter Main
    :scale: 40%

Zeppelin Notebooks Install
##########################

Requirements
************

* `Git <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>`_ : Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
* `Docker CE <https://docs.docker.com/install/>`_ : Docker Community Edition (CE) is ideal for developers and small teams looking to get started with Docker and experimenting with container-based apps.
* `Docker Compose <https://docs.docker.com/compose/>`_ : a tool for defining and running multi-container Docker applications.

Steps
*****

Coming soon..