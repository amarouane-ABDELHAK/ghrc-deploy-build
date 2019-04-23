FROM continuumio/miniconda3
LABEL maintainer="am0089@uah.edu" \
     author="Abdelhak Marouane"
RUN apt-get update && \
    apt-get install -y zip
RUN useradd -u 500 -ms /bin/bash bamboo
RUN apt-get install -y nano 
USER bamboo 
COPY requirements.sh /home/bamboo
ENV HOME=/home/bamboo
RUN mkdir $HOME/process
WORKDIR /home/bamboo/process
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
    . $HOME/requirements.sh


#ENTRYPOINT [ "/bin/bash", "/home/bamboo/build.sh"]