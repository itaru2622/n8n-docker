
start:
	TZ=${TZ} docker compose up -d

stop:
	docker compose down

stop-with-clean:
	docker compose down -v

shell:
	docker compose exec -it n8n /bin/sh
