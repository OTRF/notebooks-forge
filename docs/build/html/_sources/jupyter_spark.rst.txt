Jupyter Spark Server
====================

A notebook server built for any operator looking to leverage advanced analytics provided by Apache Spark. 

Jupyter Python Libraries
########################

Pandas
******

`Pandas <https://pandas.pydata.org/>`_ is an open source, BSD-licensed library providing high-performance, easy-to-use data structures and data analysis tools for the Python programming language.

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