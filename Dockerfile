FROM continuumio/miniconda3
LABEL maintainer="am0089@uah.edu" \
     author="Abdelhak Marouane"
RUN apt-get update && \
    apt-get install -y zip
RUN useradd -u 500 -ms /bin/bash bamboo
RUN apt-get install -y nano 
#Install dependencies
RUN apt-get install -y libxml2-utils
RUN pip install pytest==4.4.1
RUN pip install awscli
USER bamboo 
ENV HOME=/home/bamboo
WORKDIR $HOME
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash 

COPY requirements.sh $HOME/ 
RUN . $HOME/requirements.sh


# Adding the build here because we will be modifying it a lot
# And we want to use the cache layers of docker
COPY build.sh $HOME/ 

ENTRYPOINT [ "/bin/bash", "/home/bamboo/build.sh"]