FROM steamcmd/steamcmd

LABEL maintainer="M1keSK <ing.michal.hudak@gmail.com>"

# build arguments
ARG GAME_BUILD
#ARG GAME_VERSION

# metadata
LABEL build="${BUILD}"
#LABEL version="${VERSION}"
