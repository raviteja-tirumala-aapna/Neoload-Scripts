FROM bkimminich/juice-shop:latest

USER root

WORKDIR /juice-shop

RUN npm install newrelic --no-save

COPY newrelic.js /juice-shop/newrelic.js

ENV NODE_OPTIONS="-r newrelic"

USER 65532
