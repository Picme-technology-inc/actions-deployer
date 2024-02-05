FROM node:14-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/serverless/github-action"
LABEL homepage="https://github.com/serverless/github-action"
LABEL maintainer="Serverless, Inc. <hello@serverless.com> (https://serverless.com)"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands. Adds serverless-plugin-go"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Install Golang
RUN curl -L https://go.dev/dl/go1.18.10.linux-amd64.tar.gz > /tmp/go.tar.gz
RUN tar -xzf /tmp/go.tar.gz -C /usr/local 
RUN ln -snf /usr/local/go/bin/go /usr/bin/go

# Install Serverless
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
