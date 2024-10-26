## 構成

```
spring-react/
│
├── backend/ # Spring Boot アプリケーション
│   └── pom.xml # Maven の設定ファイル
│
├── frontend/ # React(vite) + TypeScript アプリケーション
│   └── package.json # Node.js の設定ファイル
│
└── .devcontainer/ # Devcontainer の構成
    ├── devcontainer.json
    ├── Dockerfile
    └── docker-compose.yml
```

## React のビルド

```
# React のビルドを行う
npm run build

# Spring の静的資材置き場が、/backend/src/main/resources/static に置かれる
```

## アプリの起動

```
cd backend
mvn spring-boot:run
```

## DB

### .env ファイルの作成

- .env.sample を .env に変更する

  ```
  # ./.env
  # バックアップの対象ディレクトリ
  TARGET_DIR="(プロジェクトのある場所の絶対パス)"
  # バックアップ保存先
  BACKUP_DIR="(バックアップを置きたい場所)"
  ```

### バックアップ

※ マウントした DB のディレクトリをバックアップするのはおすすしない

```
$ sudo ./db_container_bk.sh
```

### 復元

```
$ sudo ./db_restore.sh
```

## Maven

### checkstyle

- java  
  https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml

### formatter

- java  
  https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml

### spotless での formatter

https://github.com/diffplug/spotless/blob/main/plugin-maven/README.md#java

```
user@machine repo % mvn spotless:check
[ERROR]  > The following files had format violations:
[ERROR]  src\main\java\com\diffplug\gradle\spotless\FormatExtension.java
[ERROR]    -\t\t····if·(targets.length·==·0)·{
[ERROR]    +\t\tif·(targets.length·==·0)·{
[ERROR]  Run 'mvn spotless:apply' to fix these violations.
user@machine repo % mvn spotless:apply
[INFO] BUILD SUCCESS
user@machine repo % mvn spotless:check
[INFO] BUILD SUCCESS
```
