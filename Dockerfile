FROM bkimminich/juice-shop:latest AS juice

FROM node:24-bookworm-slim

WORKDIR /juice-shop

COPY --from=juice /juice-shop /juice-shop

RUN npm install newrelic --no-save

COPY newrelic.js /juice-shop/newrelic.js

ENV NODE_OPTIONS="-r newrelic"

USER 65532

EXPOSE 3000

CMD ["node", "/juice-shop/build/app.js"]
