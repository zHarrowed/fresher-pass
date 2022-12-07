# Fresher pass

Fresher pass for the new students to compete on collecting points from events and tasks.

## Initial setup
```
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:setup
```

## Running the app
```
docker compose up
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
docker compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker compose run --rm web bin/rails c
```

## Running tests
```
docker compose run --rm web bin/rspec
```

## Code style checking and correction
Analyzing code style issues
```
rubocop
```
Safe auto-correct
```
rubocop -a
```
Full auto-correct
```
rubocop -A
```

