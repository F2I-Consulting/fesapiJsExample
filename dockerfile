FROM python:3.8

ENV SRC_DIR /usr/bin/src/webapp/src

COPY . ${SRC_DIR}/

WORKDIR ${SRC_DIR}

#python sends print and log statements directly to stdout
ENV PYTHONUNBUFFERED=1

# note from https://docs.docker.com/engine/reference/builder/ 
# The EXPOSE instruction informs Docker that the container listens on the specified 
# network ports at runtime. You can specify whether the port listens on TCP or UDP, 
# and the default is TCP if the protocol is not specified.
# The EXPOSE instruction does not actually publish the port. It functions as a type
# of documentation between the person who builds the image and the person who runs
# the container, about which ports are intended to be published. To actually publish
# the port when running the container, use the -p flag on docker run to publish and 
# map one or more ports, or the -P flag to publish all exposed ports and map them to
# high-order ports.
#
# in order to run the container on your docker desktop use, please use:
# docker run -p 80:80 [IMAGE]
EXPOSE 80 443

CMD ["python", "servewasm.py", "--port", "80"]
