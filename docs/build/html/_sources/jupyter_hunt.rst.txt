Jupyter Hunt Server
===================

A notebook server built for defensive operators with several tools to connect to known SIEMs and be able to analyze data to find potential adversaries in the network.
This server is built on the top of the `Jupyter Spark` server available in this repo in order to provide advanced analytics capabilities via Apache Spark.

Jupyter Python Libraries
########################

Pandas
******

`Pandas <https://pandas.pydata.org/>`_ is an open source, BSD-licensed library providing high-performance, easy-to-use data structures and data analysis tools for the Python programming language.

Altair
******

`Altair <https://github.com/altair-viz/altair>`_ is a declarative statistical visualization library for Python.
With Altair, you can spend more time understanding your data and its meaning.
Altair's API is simple, friendly and consistent and built on top of the powerful `Vega-Lite <https://github.com/vega/vega-lite>`_ JSON specification.

S3Fs
****

`S3Fs <https://s3fs.readthedocs.io/en/latest/index.html>`_ is a Pythonic file interface to S3. It builds on top of `boto3 <https://boto3.readthedocs.io/en/latest/>`_.
The top-level class S3FileSystem holds connection information and allows typical file-system style operations like cp, mv, ls, du, glob, etc., as well as put/get of local files to/from S3.

Elasticsearch-DSL
*****************

`Elasticsearch DSL <https://github.com/elastic/elasticsearch-dsl-py>`_ is a high-level library whose aim is to help with writing and running queries against Elasticsearch.
It is built on top of the official low-level client (`elasticsearch-py <https://github.com/elastic/elasticsearch-py>`_).
It provides a more convenient and idiomatic way to write and manipulate queries.
It stays close to the Elasticsearch JSON DSL, mirroring its terminology and structure.
It exposes the whole range of the DSL from Python either directly using defined classes or a queryset-like expressions.

Matplotlib
**********

`Matplotlib <https://github.com/matplotlib/matplotlib>`_ is a Python 2D plotting library which produces publication-quality figures in a variety of hardcopy formats and interactive environments across platforms.
Matplotlib can be used in Python scripts, the Python and IPython shell (à la MATLAB or Mathematica), web application servers, and various graphical user interface toolkits.

Scikit-learn
************

`Scikit-learn <https://github.com/scikit-learn/scikit-learn>`_ is a Python module for machine learning built on top of SciPy and distributed under the 3-Clause BSD license.

KSQL-Python
***********

`KSQL-Python <https://github.com/bryanyang0528/ksql-python>`_ is a python wrapper for the KSQL REST API. Easily interact with the KSQL REST API using this library.

Confluent-Kafka-Python
**********************

`Confluent-kafka-python <https://github.com/confluentinc/confluent-kafka-python>`_ is Confluent's Python client for `Apache Kafka <http://kafka.apache.org/>`_ and the `Confluent Platform <https://www.confluent.io/product/compare/>`_.

Splunk-SDK
**********

The `Splunk Software Development Kit (SDK) <https://pypi.org/project/splunk-sdk/>`_ for Python contains library code and examples designed to enable developers to build applications using Splunk.

Kqlmagic
********

The `Kqlmagic <https://github.com/Microsoft/jupyter-Kqlmagic/tree/master>`_ magic extension enables notebook experience, exploring Microsoft Azure Monitor data: Azure Data Explorer (Kusto), ApplicationInsights, and LogAnalytics data, from Jupyter notebook (Python3 kernel), using kql (Kusto Query language).

Neo4j
*****

The official `Neo4j driver for Python <https://github.com/neo4j/neo4j-python-driver>`_ supports Neo4j 3.0 and above and Python versions 2.7, 3.4, 3.5, 3.6, and 3.7.
It connects to the database using the binary protocol. It aims to be minimal, while being idiomatic to Python.

Networkx
********

`NetworkX <https://networkx.github.io/>`_ is a Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.

Nxviz
*****

`Nxviz <https://pypi.org/project/nxviz/>`_ is a graph visualization package for NetworkX. With nxviz, you can create beautiful graph visualizations by a declarative API.

Jupyter Kernels Available
#########################

IPython Kernel (Python)
*************************

The Jupyter team maintains the `IPython kernel <https://github.com/ipython/ipython>`_ since the Jupyter notebook server depends on the IPython kernel functionality.
Many other languages, in addition to Python, may be used in the notebook.

PySpark Kernel (Python)
************************

A python Kernel to enable `Apache Spark for python <http://spark.apache.org/docs/latest/api/python/index.html>`_.
Writing PySpark Applications is really no different than writing normal Python applications or packages.
It’s quite similar to writing command-line applications in particular.
Spark doesn’t have a build concept, just Python scripts, so to run an application, you simply execute the script against the cluster. 

Syplon Kernel (Scala/Python)
*****************************

A Scala kernel for Apache Spark that uses `metakernel <https://github.com/Calysto/metakernel>`_ in combination with `py4j <https://www.py4j.org/>`_.

R Kernel (R)
************

An R kernel for `Apache SparkR <http://spark.apache.org/docs/latest/sparkr.html#sparkr-r-on-spark>`_.
SparkR is an R package that provides a light-weight frontend to use Apache Spark from R.
In Spark 2.4.1, SparkR provides a distributed data frame implementation that supports operations like selection, filtering, aggregation etc. (similar to R data frames, dplyr) but on large datasets.
SparkR also supports distributed machine learning using MLlib.