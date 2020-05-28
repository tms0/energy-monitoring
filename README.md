# Energy Monitoring

Ce projet permet de suivre en temps réel la consommation et la production d'électricité de mon domicile. 

Il est basé sur la stack Open Source [TICK](https://www.influxdata.com/time-series-platform/) (Telegraf, InfluxDB, Chronograf, Kapacitor) : [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/) est utilisé pour récupérer les données depuis différentes sources (compteur Enedis, onduleur photovoltaïque) et les enregistrer dans une base de données InfluxDB. [Chronograf](https://www.influxdata.com/time-series-platform/chronograf/) permet de visualiser ces données sur des tableaux de bord. Et enfin [Kapacitor](https://www.influxdata.com/time-series-platform/kapacitor/) va permettre de faire de l'alerting.

## Installation

### Récupération des données depuis un compteur Enedis

La récupération des données du compteur Enedis est réalisée depuis un autre projet : [teleinfo-publisher](https://github.com/tms0/teleinfo-publisher).
Celui-ci utilise le protocole [MQTT](https://fr.wikipedia.org/wiki/MQTT) pour transmettre les informations à Telegraf.

Cette méthode permet de récupérer les informations du compteur Enedis depuis une machine différente que celle qui fait tourner ce projet. Par exemple, un [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) branché à côté du compteur fera largement l'affaire.

### Installation du projet

- Installer les dépendances nécessaires :
  ```
  $ curl -sSL https://get.docker.com | sh
  $ sudo apt install git docker-compose
  ```
- Récupérer le projet avec Git : `git clone https://github.com/tms0/energy-monitoring.git`
- Modifier le fichier `.env-sample` pour renseigner les valeurs spécifiques à votre environnement et le renommer en `.env`
- Lancer l'application avec la commande suivante : `docker-compose up -d`
- Lors du premier lancement, il faut initialiser la base de données (pour la téléinformation en mode historique) :
  ```
  $ ./init_mode_historique.sh
  ```

## Visualisation des données

Ouvrir Chronograf dans un navigateur à l'adresse `http://<hostname>:8888`.

Des tableaux de bord sont disponibles dans le répertoire dashboards (TODO), ils peuvent être importés depuis la page "Dashboards" de Chronograf.

## Autres sources de données (onduleur photovoltaïque, etc) :

Il est assez simple de rajouter d'autres sources de données, en utilisant Telegraf.

Pour le moment, seule la configuration pour un onduleur Fronius est disponible, si vous souhaitez soumettre une nouvelle configuration, n'hésitez pas !

-  Onduleur Fronius (photovoltaïque) (TODO)




