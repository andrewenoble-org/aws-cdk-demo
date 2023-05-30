FROM python:3.9.16-slim-bullseye

# set current working directory
WORKDIR /home/project

# install standard linux packages
RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y \
        curl \
        git \
        make \
        nano \
        unzip \
        vim \
        zip \
    && apt-get clean

# install python packages
COPY requirements.txt .
RUN /usr/local/bin/python -m pip install --upgrade pip \
    && /usr/local/bin/python -m pip install ipython jupyterlab \
    && /usr/local/bin/python -m pip install -r requirements.txt
RUN rm requirements.txt

# set python environment variable(s)
ENV PYTHONPATH .:/home/project

# configure bash
COPY assets/dockerfile/root/.bashrc /root/.bashrc

# install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
RUN rm -r aws awscliv2.zip

# install docker
RUN curl -sSL https://get.docker.com/ | sh

# install node and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@9.6.7 

# install aws-cdk
RUN npm install -g aws-cdk@2.81.0

# enable jupyter access in browser
ENTRYPOINT [ \
      "jupyter", "lab", "--notebook-dir='/'", "--ip=0.0.0.0", "--port=8888", "-y", \
      "--allow-root", "--no-browser", "--NotebookApp.password=''", \
      "--NotebookApp.token=''" \
]
