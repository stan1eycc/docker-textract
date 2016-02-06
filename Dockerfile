FROM ubuntu:14.04
MAINTAINER Stan Chen

#
ENV DEBIAN_FRONTEND noninteractive

#
RUN apt-get update && \
    apt-get install -y \
    build-essential software-properties-common python-pip

# Add PPA repository for ffmpeg
RUN add-apt-repository ppa:mc3man/trusty-media

# Install system packages required by textract
RUN apt-get update && \
    apt-get install -y \
    python-dev libxml2-dev libxslt1-dev antiword unrtf poppler-utils pstotext \
    tesseract-ocr tesseract-ocr-eng \
    tesseract-ocr-ara tesseract-ocr-bel \
    tesseract-ocr-ben tesseract-ocr-bul tesseract-ocr-ces tesseract-ocr-dan \
    tesseract-ocr-deu tesseract-ocr-ell tesseract-ocr-fin tesseract-ocr-fra \
    tesseract-ocr-heb tesseract-ocr-hin tesseract-ocr-ind tesseract-ocr-isl \
    tesseract-ocr-ita tesseract-ocr-jpn tesseract-ocr-kor tesseract-ocr-nld \
    tesseract-ocr-nor tesseract-ocr-pol tesseract-ocr-por tesseract-ocr-ron \
    tesseract-ocr-rus tesseract-ocr-spa tesseract-ocr-swe tesseract-ocr-tha \
    tesseract-ocr-tur tesseract-ocr-ukr tesseract-ocr-vie \
    tesseract-ocr-chi-sim tesseract-ocr-chi-tra \
    flac ffmpeg lame libmad0 libsox-fmt-mp3 sox zlib1g-dev libjpeg-dev

# Install textract by pip
RUN pip install textract

# Install packages for dev-env
RUN apt-get install -y \
    python python-setuptools git

# Remove apt lists
RUN rm -rf /var/lib/apt/lists/*
