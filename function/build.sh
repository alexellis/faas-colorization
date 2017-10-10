#!/bin/sh

#faas-cli build --image openfaas-colorization --handler . --name colorization --lang Dockerfile
faas-cli build -f colorization.yml
