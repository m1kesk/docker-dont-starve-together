FROM steamcmd/steamcmd

# set maintainer
LABEL maintainer="M1keSK <ing.michal.hudak@gmail.com>"

# set environment variables
ENV APP_ID=343050
ENV INSTALL_DIR=/dst

# install dependencies
RUN apt-get update
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get autoremove -y
RUN apt-get clean -y

# set steam app
RUN steamcmd +login anonymous +quit
RUN echo $APP_ID > steam_appid.txt

# install server
RUN mkdir -p $INSTALL_DIR
RUN steamcmd +force_install_dir $INSTALL_DIR +login anonymous +app_update $APP_ID validate +quit
# RUN steamcmd +force_install_dir $INSTALL_DIR +login $STEAM_USER $STEAM_PASS +app_update $APP_ID validate +quit

# set working directory
WORKDIR $INSTALL_DIR/bin64

# set entrypoint
ENTRYPOINT ["./dontstarve_dedicated_server_nullrenderer_x64"]
