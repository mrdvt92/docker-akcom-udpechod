FROM almalinux:9 AS build

RUN yum -y install make gcc which libtool autoconf automake pkg-config file diffutils gzip git
RUN git clone https://github.com/alaskacommunications/akcom-udpecho.git app
WORKDIR /app/build
RUN ../autogen.sh
RUN ../configure --prefix=/usr
RUN make
RUN find
RUN gzip ./docs/akcom-udpecho.1
RUN gzip ./docs/akcom-udpechod.8

FROM almalinux:9
RUN yum -y install man
COPY --from=build /app/build/src/akcom-udpecho        /usr/bin/
COPY --from=build /app/build/src/akcom-udpechod       /usr/sbin/
COPY --from=build /app/build/docs/akcom-udpecho.1.gz  /usr/share/man/man1/
COPY --from=build /app/build/docs/akcom-udpechod.8.gz /usr/share/man/man8/

CMD ["/usr/sbin/akcom-udpechod", "--foreground", "--echoplus"]
