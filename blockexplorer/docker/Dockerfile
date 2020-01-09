FROM bitwalker/alpine-elixir-phoenix:1.9.0.1.9
# WORKDIR /app
RUN apk --no-cache --update add alpine-sdk gmp-dev automake libtool inotify-tools autoconf python

EXPOSE 4000
ARG SECRET_KEY_BASE_ARG=${SECRET_KEY_BASE}

ENV PORT=4000 \
    MIX_ENV="prod" \
    SECRET_KEY_BASE=${SECRET_KEY_BASE_ARG}

# Cache elixir deps
ADD mix.exs mix.lock ./
ADD apps/block_scout_web/mix.exs ./apps/block_scout_web/
ADD apps/explorer/mix.exs ./apps/explorer/
ADD apps/ethereum_jsonrpc/mix.exs ./apps/ethereum_jsonrpc/
ADD apps/indexer/mix.exs ./apps/indexer/

# RUN mix do local.hex --force, local.rebar --force
RUN mix do deps.get, deps.compile

ADD . .

ARG COIN_NAME
RUN if [ "$COIN_NAME" != "" ]; then sed -i s/"POA"/"${COIN_NAME}"/g apps/block_scout_web/priv/gettext/en/LC_MESSAGES/default.po; fi

# Run forderground build and phoenix digest
RUN mix compile

# Add blockscout npm deps
RUN cd apps/block_scout_web/assets/ && \
    npm ci && \
    npm rebuild node-sass && \
    npm run deploy && \
    cd -

RUN cd apps/explorer/ && \
    npm install && \
    apk del --force-broken-world alpine-sdk gmp-dev automake libtool inotify-tools autoconf python