FROM nginx:latest
LABEL maintainer="Oresama-lab. <oresamalabo@gmail.com>"
LABEL version="0.1.0"

# Replace Shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# make sure apt is up to date
RUN apt update --fix-missing
RUN apt install -y curl
RUN apt install -y build-essential libssl-dev

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.17.1

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Check the node's version
RUN node -v

# Set the work directory and copy drawthe.net's files
# You need to clone cidrblock/drawthe.net repository from GitHub previosly
# and the files must be stored in the same directory as the Dockerfile
#
#   => git clone https://github.com/cidrblock/drawthe.net.git
#
WORKDIR /usr/share/nginx/html
COPY drawthe.net .