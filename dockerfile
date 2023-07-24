FROM node:18-alpine
WORKDIR /app

# install pnpm
RUN npm install -g pnpm

# dependencies installation
COPY package.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install

# copy the app
COPY . .

# build the app before running
RUN pnpm build

# run the app
CMD ["pnpm", "start:prod"]