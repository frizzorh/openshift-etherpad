# Use Red Hat Universal Base Image 8 - NodeJS 14 version
FROM etherpad/etherpad:2.3.2

LABEL name="Etherpad Lite" \
      io.k8s.display-name="Etherpad Lite" \
      io.k8s.description="Provide an Etherpad on top of Red Hat OpenShift." \
      io.openshift.expose-services="9001" \
      io.openshift.tags="etherpad" \
      version=$ETHERPAD_VERSION \
      release="1"

USER root

COPY ./root/opt/etherpad/bin/fix-permissions.sh /opt/etherpad-lite/bin
#COPY ./root/opt/etherpad/container-entrypoint.sh /opt/etherpad/
WORKDIR /opt/etherpad-lite

# Fix permissions to run on OpenShift /opt/etherpad-lite/
RUN chmod -R 777 /opt/etherpad-lite && \
    /opt/etherpad-lite/bin/fix-permissions.sh /opt/etherpad-lite

# Run as a random user. This happens on openshift by default so we
# might as well always run as a random user
USER 1001
