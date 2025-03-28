#!/bin/sh

LAZY_BEANCOUNT_HOST=${LAZY_BEANCOUNT_HOST:-"localhost"}
LAZY_BEANCOUNT_PORT=${LAZY_BEANCOUNT_PORT:-8777}
FAVA_PORT=${FAVA_PORT:-5003}
BEANCOUNT_IMPORT_PORT=${BEANCOUNT_IMPORT_PORT:-8101}

docker rm lazybean;
docker run -it \
    -v $PWD/$1:/workspace \
    -p ${FAVA_PORT}:5000 \
    -p ${BEANCOUNT_IMPORT_PORT}:8101 \
    -p ${LAZY_BEANCOUNT_PORT}:8501 \
    -e LAZY_BEANCOUNT_HOST=$LAZY_BEANCOUNT_HOST \
    -e LAZY_BEANCOUNT_PORT=$LAZY_BEANCOUNT_PORT \
    -e FAVA_PORT=$FAVA_PORT \
    -e BEANCOUNT_IMPORT_PORT=$BEANCOUNT_IMPORT_PORT \
    --name lazybean \
    --user $(id -u):$(id -g) \
    vandereer/lazy-beancount:latest
