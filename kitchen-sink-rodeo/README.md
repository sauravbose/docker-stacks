# Jupyter Notebook Scientific Python Stack

## What it Gives You

* yHat Rodeor server 
* Conda Python 3.4.x and Python 2.7.x environments
* nltk, pandas, matplotlib, scipy, seaborn, scikit-learn, scikit-image, sympy, cython, patsy, statsmodel, cloudpickle, dill, numba, bokeh pre-installed
* Unprivileged user `choptiu` (uid=1000, configurable, see options) in group `users` (gid=100) with ownership over `/home/choptiu` and `/opt/conda`
* **(v4.0.x)** [tini](https://github.com/krallin/tini) as the container entrypoint and [start-notebook.sh](../minimal-notebook/start-notebook.sh) as the default command

## Basic Use

The following command starts a container with the Notebook server listening for HTTP connections on port 8000 without authentication configured.

```
docker run -d -p 8000:8000 choptiu/kitchen-sink-rodeo

```

## Docker Options

You may customize the execution of the Docker container and the Rodeo server it contains with the following optional arguments.

* **(v4.0.x)** `-e NB_UID=1000` - Specify the uid of the `choptiu` user. Useful to mount host volumes with specific file ownership.
* `-e GRANT_SUDO=yes` - Gives the `choptiu` user passwordless `sudo` capability. Useful for installing OS packages. **You should only enable `sudo` if you trust the user or if the container is running on an isolated host.**
* `-v /some/host/folder/for/work:/home/choptiu/work` - Host mounts the default working directory on the host to preserve work even when the container is destroyed and recreated (e.g., during an upgrade).
* `-e PORT=8000` - Configures Rodeo to listen on the given port. Defaults to 8000, which is the port exposed within the Dockerfile for the image. When using Docker's `--net=host`, you may wish to use this option to specify a particular port.

## Conda Environments

The default Python 3.x [Conda environment](http://conda.pydata.org/docs/using/envs.html) resides in `/opt/conda`. A second Python 2.x Conda environment exists in `/opt/conda/envs/python2`. You can [switch to the python2 environment](http://conda.pydata.org/docs/using/envs.html#change-environments-activate-deactivate) in a shell by entering the following:

```
source activate python2
```

You can return to the default environment with this command:

```
source deactivate
```

The commands `ipython`, `python`, `pip`, `easy_install`, and `conda` (among others) are available in both environments.
