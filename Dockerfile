FROM bvlc/caffe:cpu

RUN apt-get update && apt-get install unzip python-tk -qy

RUN wget https://github.com/developius/colorization/archive/master.zip && unzip master.zip
#ADD https://github.com/developius/colorization/archive/master.zip .
#RUN unzip master.zip

WORKDIR /workspace/colorization-master

RUN wget http://eecs.berkeley.edu/~rich.zhang/projects/2016_colorization/files/demo_v2/colorization_release_v2.caffemodel -O ./models/colorization_release_v2.caffemodel

RUN pip install http_parser

#ADD https://github.com/openfaas/faas/releases/download/0.6.5/fwatchdog /usr/bin
ADD ./fwatchdog /usr/bin/
RUN chmod +x /usr/bin/fwatchdog

ENV fprocess="python -u index.py"
ENV read_timeout="60"

#COPY colorize.py colorize.py
COPY function    function
COPY index.py   .

ENV write_timeout="60"
ENV afterburn=true

CMD ["fwatchdog"]
