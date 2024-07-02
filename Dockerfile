FROM node:lts-bullseye-slim

# アプリケーションディレクトリを作成し、所有者をnodeユーザーに変更
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

# nodeユーザーに変更
USER node

# package.jsonをコピーし、npm installを実行
COPY --chown=node:node package*.json ./

RUN npm install

# アプリケーションコードをコピー
COPY --chown=node:node . .

EXPOSE 3000
CMD ["npm", "run", "dev"]

# イメージ作成
# docker build -t expressjs-image .

# コンテナ起動
# docker run -p 3000:3000 --name my-expressjs-container expressjs-image