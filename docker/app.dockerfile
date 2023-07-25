FROM node:18-alpine
WORKDIR /usr/app

# installing pnpm
RUN npm install -g pnpm

# installing necessary dependencies
COPY package.json .
COPY pnpm-lock.yaml .
RUN pnpm install

# copy the whole app directory and build the app
COPY . .
RUN pnpm build

# run app
CMD ["pnpm", "start"]
