FROM node:14-alpine3.13
MAINTAINER cheungmk

WORKDIR /app
ENV DSUI_PROJECT_ID dsui-local
ENV DSUI_PORT 8082
ENV DSUI_DATASTORE_ENDPOINT datastore:8081

EXPOSE $UI_PORT

RUN yarn global add google-cloud-gui@0.2.2

COPY ./entrypoint.sh .

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
