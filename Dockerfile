# Multi-stage build: web app + API in one small image.
FROM node:22-alpine AS web
WORKDIR /app/web
COPY web/package*.json ./
RUN npm ci --no-audit --no-fund
COPY web/ ./
RUN npm run build

FROM node:22-alpine AS server
WORKDIR /app/server
COPY server/package*.json ./
RUN npm ci --omit=dev --no-audit --no-fund
COPY server/ ./
COPY --from=web /app/web/dist /app/web/dist

ENV NODE_ENV=production PORT=4000 HOST=0.0.0.0 TRUST_PROXY=1
RUN addgroup -S aura && adduser -S aura -G aura && mkdir -p /app/server/data && chown -R aura:aura /app
USER aura
VOLUME ["/app/server/data"]
EXPOSE 4000
HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD wget -qO- http://127.0.0.1:4000/api/health || exit 1
CMD ["node", "src/index.js"]
