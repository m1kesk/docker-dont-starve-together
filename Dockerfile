FROM steamcmd/steamcmd

# set maintainer
LABEL maintainer="M1keSK <ing.michal.hudak@gmail.com>"

# set environment variables
ENV APP_ID=343050
ENV INSTALL_DIR=/home/steam/dst/game

# install dependencies
RUN apt-get update
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get autoremove -y
RUN apt-get clean -y

# set steam app
RUN steamcmd +login anonymous +quit
RUN echo $APP_ID > steam_appid.txt

# create folders
RUN mkdir -p /home/steam/dst
RUN mkdir -p /home/steam/dst/save
RUN mkdir -p /home/steam/dst/mods
RUN mkdir -p /home/steam/dst/ugc_mods

# install server
RUN mkdir -p $INSTALL_DIR
RUN steamcmd +force_install_dir $INSTALL_DIR +login anonymous +app_update $APP_ID validate +quit
# RUN steamcmd +force_install_dir $INSTALL_DIR +login $STEAM_USER $STEAM_PASS +app_update $APP_ID validate +quit

# set working directory
WORKDIR $INSTALL_DIR/bin64

# set entrypoint
ENTRYPOINT ["./dontstarve_dedicated_server_nullrenderer_x64"]
