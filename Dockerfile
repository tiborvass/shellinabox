FROM ubuntu:14.04
RUN apt-get update && apt-get -y install git libssl-dev libpam0g-dev zlib1g-dev dh-autoreconf
RUN useradd -m user
COPY . /shellinabox
RUN chown -R user:user /shellinabox
WORKDIR /shellinabox
RUN autoreconf -i
RUN ./configure && make
USER user
EXPOSE 4200
ENTRYPOINT ["/shellinabox/shellinaboxd", "-v"]
