#!/bin/bash
REPO_SSH="git@github.com:YOUR_USERNAME/YOUR_REPO.git"
WORKDIR="/tmp/devops_repo"
BACKUP_DIR="$HOME/backup"
PROJECT_NAME="devops_internship"
mkdir -p "$BACKUP_DIR"
rm -rf "$WORKDIR"
git clone "$REPO_SSH" "$WORKDIR"
ARCHIVE_NAME="${PROJECT_NAME}_${MAJOR}.${MINOR}.${PATCH}.tar.gz"

tar -czf "$ARCHIVE_NAME" -C /tmp devops_repo
mv "$ARCHIVE_NAME" "$BACKUP_DIR/"
SIZE=$(stat -c %s "$BACKUP_DIR/$ARCHIVE_NAME")
echo "[]" > "$BACKUP_DIR/versions.json"
jq ". += [{
  \"version\": \"${MAJOR}.${MINOR}.${PATCH}\",
  \"date\": \"$(date +'%d.%m.%Y')\",
  \"size\": $SIZE,
  \"filename\": \"$ARCHIVE_NAME\"
}]" "$BACKUP_DIR/versions.json" > tmp.json && mv tmp.json "$BACKUP_DIR/versions.json"

if [[ "$1" == "-max-backups" ]]; then
  MAX="$2"
fi
ls -t "$BACKUP_DIR"/*.tar.gz | tail -n +$((MAX+1)) | xargs rm -f
for ((i=1; i<=MAX_RUNS; i++)); do
  ./backup.sh
done

