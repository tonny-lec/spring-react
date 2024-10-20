## 構成

```
spring-react/
│
├── backend/ # Spring Boot アプリケーション
│ └── pom.xml # Maven の設定ファイル
│
├── frontend/ # React + TypeScript アプリケーション
│ └── package.json # Node.js の設定ファイル
│
└── .devcontainer/ # Devcontainer の構成
└── devcontainer.json
└── Dockerfile
```

## backend フォルダで

```
cd backend
mvn spring-boot:run
```

## checkstyle

- java
  https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml

## formatter

- java
  https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
