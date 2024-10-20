# ベースイメージにOpenJDK 21とNode.jsを含むものを指定
# 使用イメージ
# https://hub.docker.com/layers/cimg/openjdk/21.0.5-node/images/sha256-523748018f59f7612ccbe5a6f04ebcba0b97ca400023df9ffde05437ae4678a8?context=explore
FROM cimg/openjdk:21.0.5-node

# Javaの確認
RUN java --version && mvn --version && node --version && npm --version

# PostgreSQLクライアントのインストール
RUN sudo apt-get install -y postgresql-client

# 作業ディレクトリを指定
WORKDIR /workspace
