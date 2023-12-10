FROM python:2
RUN apt-get update
RUN apt-get install -y iputils-ping vim net-tools dstat wget
RUN wget -O /home/site_web.zip "https://gist.github.com/ttwthomas/bcfc524e0328343c6e70d0ac93f4ef3e/archive/a7b8c232554c58dddb06dd7a06025a45f92b0e66.zip"
RUN mkdir -p /home/site
RUN unzip /home/site_web.zip -d /home/site
ENTRYPOINT ["/usr/bin/python", "-m", "SimpleHTTPServer", "7777"]

