####
#
# Build the image with:
#
# docker build -t bric3/hugo-builder .
#
# Then run the container using:
#
# docker run --rm -it --rm -it -v $PWD:/src bric3/hugo-builder cd /src && hugo
#
###
FROM registry.fedoraproject.org/fedora-minimal

ARG HUGO_VERSION=0.69.0
ARG ASCIIDOCTOR_VERSION=2.0.10
ARG ASCIIDOCTOR_DIAGRAM_VERSION=2.0.2

RUN microdnf -y install wget ruby tar && microdnf clean all

RUN gem install asciidoctor:${ASCIIDOCTOR_VERSION} asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION}

# Downloading latest manually as packages are a bit dated
RUN mkdir /hugo \
  && cd /hugo \
  && wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
  && tar xvf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
