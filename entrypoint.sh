#!/bin/bash

until ! psql -q -h $PGHOST -p $PGPORT -U $PGUSER -c '\q' 2>/dev/null;
do
  >&2 echo "$(date) - waiting for database to start"
  sleep 2
done

mix ecto.create
mix ecto.migrate
mix phx.server