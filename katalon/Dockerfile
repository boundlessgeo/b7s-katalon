#####
# quay.io/boundlessgeo/b7s-katalon:federal
# Google Chrome 62.0.3202.75
# Mozilla Firefox 52.0.2
# Katalon Studio 5.3.0
#####

FROM b7s-katalon-base

# common environment variables
ENV KATALON_KATALON_ROOT_DIR=$KATALON_ROOT_DIR/katalon
ENV KATALON_KATALON_INSTALL_DIR=/opt/katalonstudio

# copy scripts
RUN mkdir -p $KATALON_KATALON_ROOT_DIR
WORKDIR $KATALON_KATALON_ROOT_DIR
ADD ./src ./

RUN $KATALON_MAKE_EXECUTABLE_SCRIPT .

RUN ./index.sh
RUN $KATALON_CLEAN_UP_SCRIPT

WORKDIR /app

ENTRYPOINT cat $KATALON_VERSION_FILE && $KATALON_KATALON_ROOT_DIR/scripts/katalon-execute.sh