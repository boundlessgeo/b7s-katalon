FROM ubuntu:16.04

# product drivers
ENV CHROME_DEB_URL=https://s3.amazonaws.com/b7s-deb/chrome64_62.0.3202.75.deb
ENV FIREFOX_DEB_URL=https://s3.amazonaws.com/b7s-deb/firefox-mozilla-build_52.0.2-0ubuntu1_amd64.deb

# common environment variables
ENV KATALON_ROOT_DIR=/katalon
ENV KATALON_BASE_ROOT_DIR=/katalon/base
ENV KATALON_MAKE_EXECUTABLE_SCRIPT=$KATALON_BASE_ROOT_DIR/make_executable.sh
ENV KATALON_CLEAN_UP_SCRIPT=$KATALON_BASE_ROOT_DIR/cleanup.sh
ENV KATALON_VERSION_FILE=/katalon/version

# copy scripts
RUN mkdir -p $KATALON_BASE_ROOT_DIR
WORKDIR $KATALON_BASE_ROOT_DIR

ADD ./src ./
RUN chmod a+x $KATALON_MAKE_EXECUTABLE_SCRIPT
RUN $KATALON_MAKE_EXECUTABLE_SCRIPT .

# build
ENV DISPLAY :99
ENV DISPLAY_CONFIGURATION 2560x1080x24
RUN ./index.sh

RUN $KATALON_CLEAN_UP_SCRIPT

WORKDIR /