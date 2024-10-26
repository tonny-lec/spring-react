#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)

# .env ファイルを読み込み
if [ -f .env ]; then
  source .env
else
  echo "$DATE .env ファイルが見つかりません"
  exit 1
fi

# リストアするバックアップファイルを選択 (最新のバックアップを自動選択)
LATEST_BACKUP=$(ls -t $BACKUP_DIR/*.tar.gz | head -n 1)

# 1. バックアップファイルの確認
if [ -z "$LATEST_BACKUP" ]; then
  echo "$DATE No backup file found in $BACKUP_DIR."
  exit 1  # バックアップファイルがない場合、終了
fi

echo "$DATE Restoring from backup: $LATEST_BACKUP"

# 2. PostgreSQLコンテナの停止 (必要に応じて変更)
docker stop calmline-focus_devcontainer-db-1

# 3. 既存のデータを削除
sudo rm -rf "$TARGET_DIR"/*
echo "$DATE Existing data in $TARGET_DIR has been cleared."

# 4. バックアップファイルを解凍してリストア
sudo tar -xzf "$LATEST_BACKUP" -C /
echo "$DATE Backup restored to $TARGET_DIR."

# 5. PostgreSQLコンテナの再起動
docker start calmline-focus_devcontainer-db-1
echo "$DATE PostgreSQL container has been restarted."

echo "$DATE Restore completed successfully."
