#!/usr/bin/env bash
set -euo pipefail
REPO_NAME=${1:-sequential-topoff}
git init
git add .
git commit -m "Initial commit: sequential top-off (Cerbo GX + Node-RED + LOGO!)"
git branch -M main
if command -v gh >/dev/null 2>&1; then
  gh repo create "$REPO_NAME" --private --source . --remote origin --push
else
  echo "Now run: git remote add origin git@github.com:YOUR_USERNAME/$REPO_NAME.git && git push -u origin main"
fi
