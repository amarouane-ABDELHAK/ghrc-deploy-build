FROM continuumio/miniconda3
LABEL maintainer="am0089@uah.edu" \
     author="Abdelhak Marouane"
RUN apt-get update && \
    apt-get install -y zip
RUN useradd -u 500 -ms /bin/bash bamboo
RUN apt-get install -y nano 
#Install dependencies
RUN apt-get install -y libxml2-utils
RUN pip install pytest-cov
RUN pip install awscli
RUN apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y rsync

USER bamboo 
ENV HOME=/home/bamboo
WORKDIR $HOME
COPY requirements.sh $HOME/
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
    . $HOME/requirements.sh
 
# And we want to use the cache layers of docker
# Adding the build here because we will be modifying it a lot

COPY build.sh $HOME/build.sh 
ENTRYPOINT [ "/bin/bash", "/home/bamboo/build.sh"]

CMD ["0"]