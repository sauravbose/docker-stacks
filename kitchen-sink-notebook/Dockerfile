# Copyright (c) Jupyter Development Team.
FROM choptiu/minimal

LABEL maintainer1="Aaron J. Masino" \
      maintainer2="Saurav Bose" \
      maintainer-contact="boses1@email.chop.edu"

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libxrender1 \
    fonts-dejavu \
    gfortran \
    python-qt4 \
    gcc && apt-get clean

USER choptiu

RUN conda config --add channels r
RUN conda install --yes \
    'r-base' \
    'r-irkernel' \
    'r-plyr' \
    'r-devtools' \
    'r-dplyr' \
    'r-ggplot2' \
    'r-tidyr' \
    'r-shiny' \
    'r-rmarkdown' \
    'r-forecast' \
    'r-stringr' \
    'r-rsqlite' \
    'r-reshape2' \
    'r-nycflights13' \
    'r-caret' \
    'r-rcurl' \
    'r-randomforest' && conda clean -yt

# Install Python 3 packages
RUN conda install --yes \
    'ipywidgets' \
    'pandas' \
    'matplotlib' \
    'scipy' \
    'seaborn' \
    'scikit-learn' \
    'scikit-image' \
    'sympy' \
    'cython' \
    'patsy' \
    'statsmodels' \
    'cloudpickle' \
    'dill' \
    'numba' \
    'bokeh' \
    'pytorch' \
    'nltk' \
    'theano' \
    'tensorflow' \
    'psycopg2' \
    'sqlalchemy' \
    'pymongo' \
    'gensim' \
    && conda clean -yt

RUN conda install --yes -c philopon chainer

RUN conda install --yes -c r rpy2

RUN conda clean -yt

RUN pip install pyro-ppl

# Install Python 2 packages
#RUN conda create -p $CONDA_DIR/envs/python2 python=2.7 \
#    'ipython' \
#    'ipywidgets' \
#    'pandas' \
#    'matplotlib' \
#    'scipy' \
#    'seaborn' \
#    'scikit-learn' \
#    'scikit-image' \
#    'sympy' \
#    'cython' \
#    'patsy' \
#    'statsmodels' \
#    'cloudpickle' \
#    'dill' \
#    'numba' \
#    'bokeh' \
#    'psycopg2' \
#    'sqlalchemy' \
#    'nltk' \
#    'theano' \
#    'pytorch' \
#    'tensorflow' \
#    'pymongo'\
#    'gensim' \
#    pyzmq \
#    && conda clean -yt

#RUN pip install -U mock nose arrow requests pyro-ppl

#RUN python -m nltk.downloader all

USER root

# Install Python 2 kernel spec globally to avoid permission problems when NB_UID
# switching at runtime.
#RUN $CONDA_DIR/envs/python2/bin/python \
#    $CONDA_DIR/envs/python2/bin/ipython \
#    kernelspec install-self
