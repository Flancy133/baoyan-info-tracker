#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="baoyan-info-tracker"
REPO_URL="${REPO_URL:-https://github.com/Flancy133/baoyan-info-tracker.git}"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
TARGET="${TARGET:-codex}"
TMP_DIR="$(mktemp -d)"

case "$TARGET" in
  codex)
    SKILLS_DIR="${SKILLS_DIR:-$CODEX_HOME/skills}"
    ;;
  claude)
    SKILLS_DIR="${SKILLS_DIR:-$HOME/.claude/skills}"
    ;;
  custom)
    if [[ -z "${SKILLS_DIR:-}" ]]; then
      echo "Set SKILLS_DIR when TARGET=custom." >&2
      exit 1
    fi
    ;;
  *)
    echo "Unknown TARGET: $TARGET. Use codex, claude, or custom." >&2
    exit 1
    ;;
esac

INSTALL_DIR="$SKILLS_DIR/$SKILL_NAME"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install $SKILL_NAME." >&2
  exit 1
fi

git clone --depth 1 "$REPO_URL" "$TMP_DIR/repo" >/dev/null

mkdir -p "$SKILLS_DIR"
rm -rf "$INSTALL_DIR"
cp -R "$TMP_DIR/repo/skills/$SKILL_NAME" "$INSTALL_DIR"

echo "Installed $SKILL_NAME to $INSTALL_DIR"
echo "Try: 用 \$baoyan-info-tracker 帮我整理目标专业的保研院校，并按我的背景分成冲、稳、保三档。"
