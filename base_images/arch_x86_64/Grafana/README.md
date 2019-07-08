
# Build Container

docker build -t echteler/grafana:x86_64 --rm --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource,grafana-worldmap-panel,snuids-radar-panel,btplc-status-dot-panel,natel-discrete-panel,natel-influx-admin-panel,natel-plotly-panel" .  

# Run container

docker run -d -p3000:3000 --name grafana echteler/grafana:x86_64

# Grafana Version

Grafana version: 5.3.2

___________

automated Dockerfile generation of Grafana(armv7)

# Grafana Docker image

## Running your Grafana container

Start your container binding the external port `3000`.

```bash
docker run -d --name=grafana -p 3000:3000 echteler/grafana:latest
```

Try it out, default admin user is admin/admin.

## How to use the container

Further documentation can be found at <http://docs.grafana.org/installation/docker/>

## Dockerhub

<https://hub.docker.com/r/proxx/grafana-armv7/>
