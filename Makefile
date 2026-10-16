.PHONY: up down logs migrate revision test lint run-api run-worker run-relay

up:
 docker compose up --build -d

down:
 docker compose down -v

logs:
 docker compose logs -f api worker relay

migrate:
 alembic upgrade head

revision:
 alembic revision --autogenerate -m "$(m)"

test:
 pytest -q

lint:
 ruff check . && ruff format --check .

run-api:
 uvicorn app.main:app --reload

run-worker:
 python -m app.worker.main

run-relay:
 python -m app.worker.relay
