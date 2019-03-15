FROM bitwalker/alpine-elixir:1.8.0

# the source dir
ENV APP_DIR /usr/src/app/
WORKDIR $APP_DIR
COPY . $APP_DIR

# install the required frameworks and tools
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.4.0

EXPOSE 4000

# build the app
RUN mix clean && \
    mix deps.get && \
    mix compile