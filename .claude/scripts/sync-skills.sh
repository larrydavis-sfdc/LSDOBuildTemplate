#!/bin/bash
# Sync community skills from external repos declared in skills-manifest.yaml.
# Called by install.sh and available for manual re-sync.
#
# Usage:
#   bash .claude/scripts/sync-skills.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$CLAUDE_DIR/skills"
MANIFEST="$CLAUDE_DIR/skills-manifest.yaml"
CACHE_DIR="/tmp/lsdo-skill-sync"

if [ ! -f "$MANIFEST" ]; then
  echo "❌ skills-manifest.yaml not found at $MANIFEST"
  exit 1
fi

echo "📦 Syncing community skills from manifest..."

# Parse sources and skills from YAML (lightweight — uses grep/awk, no yq dependency)
# Clone each unique source repo once, then copy skill directories.

mkdir -p "$CACHE_DIR"

# Extract unique source repos
declare -A REPOS
declare -A BRANCHES

# Parse sources block
CURRENT_SOURCE=""
while IFS= read -r line; do
  if echo "$line" | grep -qE '^\s{2}[a-z]+:$'; then
    CURRENT_SOURCE=$(echo "$line" | sed 's/[: ]//g')
  elif echo "$line" | grep -qE '^\s{4}repo:' && [ -n "$CURRENT_SOURCE" ]; then
    REPOS[$CURRENT_SOURCE]=$(echo "$line" | sed 's/.*repo:\s*//')
  elif echo "$line" | grep -qE '^\s{4}branch:' && [ -n "$CURRENT_SOURCE" ]; then
    BRANCHES[$CURRENT_SOURCE]=$(echo "$line" | sed 's/.*branch:\s*//')
  fi
done < <(sed -n '/^sources:/,/^skills:/p' "$MANIFEST" | head -n -1)

# Clone/update each source
for SOURCE in "${!REPOS[@]}"; do
  REPO="${REPOS[$SOURCE]}"
  BRANCH="${BRANCHES[$SOURCE]:-main}"
  CLONE_DIR="$CACHE_DIR/$SOURCE"

  if [ -d "$CLONE_DIR/.git" ]; then
    echo "   Updating $SOURCE ($BRANCH)..."
    cd "$CLONE_DIR"
    git fetch origin "$BRANCH" --depth=1 --quiet 2>/dev/null
    git checkout FETCH_HEAD --quiet 2>/dev/null
    cd - >/dev/null
  else
    echo "   Cloning $SOURCE ($REPO @ $BRANCH)..."
    rm -rf "$CLONE_DIR"
    git clone --depth=1 --branch "$BRANCH" "$REPO" "$CLONE_DIR" --quiet 2>/dev/null
  fi
done

# Parse skills block and copy directories
SYNCED=0
CURRENT_SKILL_SOURCE=""
CURRENT_SKILL_PATH=""
CURRENT_SKILL_NAME=""

while IFS= read -r line; do
  if echo "$line" | grep -qE '^\s+-\s+name:'; then
    CURRENT_SKILL_NAME=$(echo "$line" | sed 's/.*name:\s*//')
    CURRENT_SKILL_SOURCE=""
    CURRENT_SKILL_PATH=""
  elif echo "$line" | grep -qE '^\s+source:'; then
    CURRENT_SKILL_SOURCE=$(echo "$line" | sed 's/.*source:\s*//')
  elif echo "$line" | grep -qE '^\s+path:'; then
    CURRENT_SKILL_PATH=$(echo "$line" | sed 's/.*path:\s*//')

    # We have all three fields — copy the skill
    if [ -n "$CURRENT_SKILL_NAME" ] && [ -n "$CURRENT_SKILL_SOURCE" ] && [ -n "$CURRENT_SKILL_PATH" ]; then
      SRC="$CACHE_DIR/$CURRENT_SKILL_SOURCE/$CURRENT_SKILL_PATH"
      DEST="$SKILLS_DIR/$CURRENT_SKILL_NAME"

      if [ -d "$SRC" ]; then
        rm -rf "$DEST"
        cp -R "$SRC" "$DEST"
        SYNCED=$((SYNCED + 1))
      else
        echo "   ⚠️  Skill path not found: $SRC (skipping $CURRENT_SKILL_NAME)"
      fi
    fi
  fi
done < <(sed -n '/^skills:/,$p' "$MANIFEST")

echo "✅ Synced $SYNCED community skill(s)."
