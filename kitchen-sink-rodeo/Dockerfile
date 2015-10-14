# Copyright (c) Jupyter Development Team.
FROM choptiu/kitchen-sink-notebook

MAINTAINER Aaron J. Masino

USER choptiu 

RUN pip install -U rodeo

USER root

# Install Python 2 kernel spec globally to avoid permission problems when NB_UID
# switching at runtime.
RUN $CONDA_DIR/envs/python2/bin/python \
    $CONDA_DIR/envs/python2/bin/ipython \
    kernelspec install-self

COPY start-rodeo.sh /usr/local/bin/

CMD ["start-rodeo.sh"]
