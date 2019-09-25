#!/bin/bash
set -e

mix do ecto.drop
mix ecto.create
mix ecto.migrate

echo " Launching Phoenix web server..."
mix phx.server