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

## spotless での formatter

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

