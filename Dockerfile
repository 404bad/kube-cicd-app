# ============ Stage 1: Install Dependencies ============
FROM node:24-alpine AS build

WORKDIR /app

COPY package*.json .
RUN npm ci

COPY . .

# ============ Stage 2: Run App ============
FROM node:24-alpine

WORKDIR /app

# Copy only what's needed from stage 1
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/app.js .

EXPOSE 3000

CMD ["node", "app.js"]
