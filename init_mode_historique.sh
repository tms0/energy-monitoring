#!/bin/bash
docker exec -it `docker ps -q --filter ancestor=influxdb` influx -execute "$(cat init_db_historique.iql)"
