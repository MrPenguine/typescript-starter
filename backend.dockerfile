FROM node:20-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy package files
COPY package*.json ./
COPY pnpm-lock.yaml ./
COPY tsconfig*.json ./
COPY nest-cli.json ./

# Install dependencies
RUN pnpm install

# Copy source code
COPY src/ ./src/

# Build the application
RUN pnpm build

# Expose the port
EXPOSE 8000

# Start the application
CMD ["pnpm", "start:prod"] 