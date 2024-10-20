## 構成

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

## backend フォルダで

```
cd backend
mvn spring-boot:run
```

## frontend フォルダで

```
cd frontend
npm install
npm start
```
