DB_USER=${DATABASE_USER:-postgres}

# wait until postgres is ready
while ! pg_isready -q -h $DATABASE_HOST -p 5432 -U $DB_USE
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# bin="/app/bin/docker_phx"
eval "$bin eval \"DockerPhx.Release.migrate\""
# start the elixir application
exec "$bin" "start"