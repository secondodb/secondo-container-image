FROM ubuntu:18.04

# Secondo related
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install \
    flex \
    bison \
    gcc \
    g++ \
    libdb5.3 \
    libdb5.3-dev \
    libdb5.3++ \
    libdb5.3++-dev \
    db5.3-util \
    libjpeg62 \
    libjpeg62-dev \
    libgsl0-dev \
    openjdk-8-jdk \
    libreadline-dev \
    librecode-dev \
    libgmp-dev \
    libncurses-dev \
    libxml2-dev \
    libboost-all-dev \
    original-awk \
    texlive \
    okular \
    swi-prolog \
    swi-prolog-nox \
    swi-prolog-x \
    swi-prolog-java 

# Container Image related
RUN apt-get -y install wget

WORKDIR /database

RUN wget http://dna.fernuni-hagen.de/Secondo.html/files/Sources/secondo-v413P1-LAT1.tgz
RUN tar xzvf secondo-v413P1-LAT1.tgz

COPY create-secondorc.sh /database

# Create
RUN bash create-secondorc.sh

RUN /bin/bash -c "source .secondorc && cd secondo && make"

COPY SecondoConfig.ini /database/secondo/bin/SecondoConfig.ini

# For debugging
RUN apt-get -y install vim net-tools

# Deinstall compile time dependencies
RUN rm secondo-v413P1-LAT1.tgz
RUN rm create-secondorc.sh

# Helpful if /bin/bash is used to log into a container
RUN echo "source /database/.secondorc" >> /etc/bash.bashrc
# COPY dot_profile /root/.profile

RUN mkdir /database/secondo-databases

ENV PATH="/database/secondo/bin:${PATH}"

WORKDIR /database/secondo/bin

COPY start-secondo-monitor.sh /database/secondo/bin/start-secondo-monitor.sh

RUN chmod 755 /database/secondo/bin/start-secondo-monitor.sh

CMD ["/bin/sh", "-c", "/database/secondo/bin/start-secondo-monitor.sh"]

#TODO Cleanup redundant source /database/.secondorc
#TODO Cleanup mulitple apt-get -y install statements
#TODO Set data directory 

EXPOSE 1234/tcp