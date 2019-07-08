
# Build Container':'

docker build -t echteler/influxdb:arm32v7 --rm .  

# Run container

docker run -d -p8086:8086 --name influxDB echteler/influxdb:arm32v7

# with Environment Variables

docker run -it -p8086:8086 --name influxDB -e -e -e -e -e echteler/influxdb:arm32v7

INFLUXDB_DB: db1
      INFLUXDB_HTTP_AUTH_ENABLED: "true"
      INFLUXDB_ADMIN_USER: admin
      INFLUXDB_ADMIN_PASSWORD: 0815
      INFLUXDB_USER: influx
      INFLUXDB_USER_PASSWORD: database

docker run -it -p8086:8086 --name influxDBtest echteler/influxdbtesting:testing

influx -username influx -password database
