ARG MIX_ENV="prod"

FROM hexpm/elixir:1.13.4-erlang-23.2.7.5-alpine-3.15.4 AS build

WORKDIR /app

RUN apk add --no-cache build-base git python3 curl && \
    mix local.hex --force && \
    mix local.rebar --force

ARG MIX_ENV
ENV MIX_ENV="${MIX_ENV}"

COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV && \
    apk add nodejs && \
    apk add npm && \
    mkdir config

COPY config/config.exs config/$MIX_ENV.exs config/

# compile dependencies
RUN mix deps.compile

COPY priv priv
COPY assets assets
COPY lib lib

RUN mix compile

COPY config/runtime.exs config/

RUN mix phx.gen.release && \
    mix release

FROM alpine:3.14.2 AS app

ARG MIX_ENV

RUN apk add --no-cache libstdc++ openssl ncurses-libs

ENV USER="elixir"

WORKDIR "/home/${USER}/app"

RUN \
  addgroup \
   -g 1000 \
   -S "${USER}" \
  && adduser \
   -s /bin/sh \
   -u 1000 \
   -G "${USER}" \
   -h "/home/${USER}" \
   -D "${USER}" \
  && su "${USER}"

USER "${USER}"

COPY --from=build --chown="${USER}":"${USER}" /app/_build/"${MIX_ENV}"/rel/mk ./
COPY start.sh ./

EXPOSE 4000

ENTRYPOINT ["./start.sh"]