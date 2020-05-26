FROM openjdk:8-jre-slim
MAINTAINER Ivan Sim, ihcsim@gmail.com

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/bjansen/docker-wso2apim"

ARG APIM_VERSION=${APIM_VERSION:-2.1.0}
RUN apt-get update && \
    apt-get install -y zip wget && \
    apt-get clean && \
    wget -P /opt http://download.openpkg.org/components/cache/wso2am/wso2am-${APIM_VERSION}.zip && \
    unzip /opt/wso2am-${APIM_VERSION}.zip -d /opt && \
    rm /opt/wso2am-${APIM_VERSION}.zip

EXPOSE 9443 9763 8243 8280 10397 7711
WORKDIR /opt/wso2am-${APIM_VERSION}
ENTRYPOINT ["bin/wso2server.sh"]
