FROM continuumio/miniconda3
LABEL maintainer="am0089@uah.edu" \
     author="Abdelhak Marouane"
# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y apt-utils && \
    apt-get install -y zip && \
    apt-get install -y nano && \
    apt-get install -y libxml2-utils && \
    pip install pytest-cov && \
    pip install awscli && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y rsync

RUN useradd -u 500 -ms /bin/bash bamboo 

USER bamboo 
ENV HOME=/home/bamboo
WORKDIR $HOME
COPY requirements.sh $HOME/
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
    . $HOME/requirements.sh
 
# And we want to use the cache layers of docker
# Adding the build here because we will be modifying it a lot

COPY build.sh $HOME/build.sh 
#ENTRYPOINT [ "/bin/bash", "/home/bamboo/build.sh"]

CMD ["0"]