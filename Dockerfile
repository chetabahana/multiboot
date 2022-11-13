FROM tensorflow/tensorflow:latest-gpu

LABEL version=v1.0.9

ENV DEBCONF_NOWARNINGS="yes"
ARG DEBIAN_FRONTEND=noninteractive

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

RUN apt-get update &>/dev/null
RUN apt-get install python3.8-venv python3-venv &>/dev/null
RUN python3.8 -m venv /maps &>/dev/null

ADD . /maps
ENV PATH="${PATH}:/maps/Scripts/"
ENTRYPOINT ["/maps/Scripts/entrypoint.sh"]
