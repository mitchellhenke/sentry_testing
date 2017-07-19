FROM elixir:latest

ENV MIX_ENV prod

RUN mix local.hex   --force
RUN mix local.rebar --force

COPY mix.* ./
RUN mix do deps.get, deps.compile

COPY . .

RUN mix compile

EXPOSE 4000
CMD mix do ecto.migrate, phx.server
