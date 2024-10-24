#!/bin/bash

# バックアップファイルと復元先のディレクトリの設定
BACKUP_DIR="/mnt/c/dump"  # バックアップの保存先
TARGET_DIR="/home/tonny/workspace/calmline-focus/postgres-data"  # リストアする永続化データの場所

# リストアするバックアップファイルを選択 (最新のバックアップを自動選択)
LATEST_BACKUP=$(ls -t $BACKUP_DIR/*.tar.gz | head -n 1)

# 1. バックアップファイルの確認
if [ -z "$LATEST_BACKUP" ]; then
  echo "No backup file found in $BACKUP_DIR."
  exit 1  # バックアップファイルがない場合、終了
fi

echo "Restoring from backup: $LATEST_BACKUP"

# 2. PostgreSQLコンテナの停止 (必要に応じて変更)
docker stop calmline-focus_devcontainer-db-1

# 3. 既存のデータを削除
sudo rm -rf "$TARGET_DIR"/*
echo "Existing data in $TARGET_DIR has been cleared."

# 4. バックアップファイルを解凍してリストア
sudo tar -xzvf "$LATEST_BACKUP" -C /
echo "Backup restored to $TARGET_DIR."

# 5. PostgreSQLコンテナの再起動
docker start calmline-focus_devcontainer-db-1
echo "PostgreSQL container has been restarted."

echo "Restore completed successfully."
