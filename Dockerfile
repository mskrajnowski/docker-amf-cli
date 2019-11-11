ARG OPENJDK_TAG=8u212
ARG SBT_VERSION=1.2.8

FROM mozilla/sbt:${OPENJDK_TAG}_${SBT_VERSION} as build

WORKDIR /tmp
ARG AMF_VERSION=3.5.4

RUN wget -O "amf.zip" "https://github.com/aml-org/amf/archive/${AMF_VERSION}.zip" && \
  unzip "amf.zip" && \
  rm "amf.zip" && \
  mv "amf-${AMF_VERSION}" "amf"

RUN cd amf && \
  sbt buildCommandLine && \
  mv "amf-${AMF_VERSION}.jar" ../amf.jar

FROM openjdk:14-alpine

ENV AMF_JAR_PATH=/opt/amf.jar

COPY --from=build /tmp/amf.jar "${AMF_JAR_PATH}"
COPY ./bin/amf /usr/bin/amf

ENTRYPOINT [ "/usr/bin/amf" ]
CMD [ ]
