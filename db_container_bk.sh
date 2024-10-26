#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)

# .env ファイルを読み込み
if [ -f .env ]; then
  source .env
else
  echo "$DATE .env ファイルが見つかりません"
  exit 1
fi

# 日付付きのバックアップファイル名
BACKUP_FILE="db_backup_$DATE.tar.gz"

# 権限エラーに備えてsudoでバックアップ実行
sudo tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$TARGET_DIR"

# 完了メッセージ
if [ $? -eq 0 ]; then
  echo "$DATE Backup succeeded: $BACKUP_FILE"
else
  echo "$DATE Backup failed."
  exit 1  # 失敗した場合、ここで終了 
fi

# 14 日以上経過した古いバックアップを削除
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +14 -exec rm {} \;

echo "$DATE Old backups cleaned up."