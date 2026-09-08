FROM bkimminich/juice-shop:latest AS juice

FROM node:24-bookworm-slim

WORKDIR /juice-shop

COPY --from=juice /juice-shop /juice-shop

RUN npm install newrelic --no-save

COPY newrelic.js /juice-shop/newrelic.js

USER 65532

EXPOSE 3000

CMD ["node", "-r", "newrelic", "/juice-shop/build/app.js"]
