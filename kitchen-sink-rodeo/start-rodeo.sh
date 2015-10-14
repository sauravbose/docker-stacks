#!/bin/bash

# Change UID of NB_USER to NB_UID if it does not match
if [ "$NB_UID" != $(id -u $NB_USER) ] ; then
    usermod -u $NB_UID $NB_USER
    chown -R $NB_UID $CONDA_DIR
fi

# Enable sudo if requested
if [ ! -z "$GRANT_SUDO" ]; then
    echo "$NB_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/notebook
fi

if [ -z ${PORT} ]; then export PORT=8000; fi

# Start rodeo
exec su $NB_USER -c "env PATH=$PATH rodeo . --host=0.0.0.0 --no-browser --port=$PORT"

