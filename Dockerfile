FROM elixir:latest

ENV MIX_ENV prod

RUN mix local.hex   --force
RUN mix local.rebar --force

COPY . .
RUN mix do deps.get, deps.compile

RUN mix compile

EXPOSE 4000
CMD mix do ecto.migrate, phx.server
