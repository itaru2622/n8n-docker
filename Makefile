wDir ?=${PWD}
nDir ?=${wDir}/workflows

w ?=${nDir}/workflow.json
c ?=${nDir}/credentials.json

start: _mkdir
	TZ=${TZ} wDir=${wDir} docker compose up -d

stop:
	docker compose down

stop-with-clean:
	docker compose down -v

# HINT: make export w=anywhere/workflow.json  c=anywhere/credentials.json
export:
	 docker compose exec -it n8n  n8n export:workflow    --all              --output ${w}
	-docker compose exec -it n8n  n8n export:credentials --all --decrypted  --output ${c}

# HINT: make import w=anywhere/workflow.json  c=anywhere/credentials.json
import:
	-docker compose exec -it n8n  n8n import:workflow                       --input  ${w}
	-docker compose exec -it n8n  n8n import:credentials                    --input  ${c}

shell:
	docker compose exec -it n8n /bin/sh
bash:
	docker compose exec -it n8n /bin/bash

_mkdir:
	mkdir -p ${nDir}
