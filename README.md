# Datastore UI

A simple docker container containing a for-devs user interface for browsing [Google Cloud Datastore](https://cloud.google.com/datastore/)

This container is simply running the NodeJS [google-cloud-gui](https://github.com/GabiAxel/google-cloud-gui/) package, though with the added feature, that it will set up a project based on environment variables, so it can be used in a `docker-compose` context and provide a smooth developer experience.

## Docker-compose example

```yaml
version: "3"

services:
  datastore:
    image: singularities/datastore-emulator
    environment:
      - DATASTORE_PROJECT_ID=dsui-local
      - DATASTORE_LISTEN_ADDRESS=0.0.0.0:8081
    ports:
      - 8081:8081

  datastore-ui:
    image: cheungmk/datastore-ui:0.2.2
    environment:
      DSUI_PROJECT_ID: dsui-local
      DSUI_PORT: 8082
      DSUI_DATASTORE_ENDPOINT: datastore:8081
    ports:
      - 8082:8082
    depends_on:
      - datastore
    links:
      - datastore
```
