FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

FROM node:20-alpine AS runner

RUN addgroup -S group && adduser -S user -G group

WORKDIR /app

COPY --from=builder /app /app
COPY --from=builder /app/node_modules /app/node_modules

USER user

EXPOSE 3000
CMD ["node", "index.js"]
    