FROM bkimminich/juice-shop:latest

USER root

RUN npm install newrelic --no-save

COPY newrelic.js /app/newrelic.js

ENV NODE_OPTIONS="-r newrelic"

USER node
