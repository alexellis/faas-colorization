#!/bin/sh

faas-cli deploy -f colorization.yml --replace -e read_timeout=60,write_timeout=60
