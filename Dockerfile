FROM elixir:latest

# Install hex package manager
# By using '--force', we don't need to type "Y" to confirm the installation

RUN mix local.hex --force && \
  mix archive.install --force hex phx_new 1.5.8 && \
  apt-get update && \
  apt-get install -y postgresql-client && \
  mix local.rebar --force

RUN mkdir -p /app
WORKDIR /app

# compile the project
RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]

