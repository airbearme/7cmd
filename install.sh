#!/usr/bin/env bash
set -e

REPO="https://raw.githubusercontent.com/airbearme/7cmd/main"
BASE="$HOME/.7cmd"
ACTIVE="$BASE/active"
VERSION="v1.2"

mkdir -p "$BASE/versions/$VERSION"

curl -fsSL "$REPO/7core.sh" -o "$BASE/versions/$VERSION/7core.sh"

rm -f "$ACTIVE"
ln -s "$BASE/versions/$VERSION" "$ACTIVE"

sed -i '/# BEGIN 7CMD/,/# END 7CMD/d' ~/.bashrc ~/.zshrc 2>/dev/null || true

{
  echo "# BEGIN 7CMD"
  echo "source \"$ACTIVE/7core.sh\""
  echo "# END 7CMD"
} >> ~/.bashrc

{
  echo "# BEGIN 7CMD"
  echo "source \"$ACTIVE/7core.sh\""
  echo "# END 7CMD"
} >> ~/.zshrc

echo "[✓] Installed 7cmd $VERSION"
