#!/bin/bash
# LSDO Build Template — One-time install script
# Run once after cloning the repo. Sets up dev environment and Salesforce tooling.
# Safe to re-run (idempotent).

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

echo ""
echo "🏥 LSDO Build Template — Install"
echo "================================"
echo ""

# --- 1. Homebrew ---
echo "🔍 Checking Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "📦 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  echo "✅ Homebrew installed."
else
  echo "✅ Homebrew found."
fi

# --- 2. Node.js ---
echo ""
echo "🔍 Checking Node.js..."
if ! command -v node &>/dev/null; then
  echo "📦 Node.js not found. Installing via Homebrew..."
  brew install node
  echo "✅ Node.js installed."
else
  NODE_VERSION=$(node --version)
  echo "✅ Node.js found ($NODE_VERSION)."
fi

# --- 3. Claude Code ---
echo ""
echo "🔍 Checking Claude Code..."
if command -v claude &>/dev/null; then
  CLAUDE_VERSION=$(claude --version 2>/dev/null | head -1)
  echo "✅ Claude Code found ($CLAUDE_VERSION)."
else
  echo ""
  echo "❌ Claude Code not found."
  echo "   Install it first using the 'Installing Claude Code for Solutions' canvas:"
  echo "     macOS/Linux: curl -fsSL https://plugins.codegen.salesforceresearch.ai/claude/install.sh | bash"
  echo ""
  echo "   Then re-run: bash install.sh"
  exit 1
fi

# --- 4. Python 3.9+ ---
echo ""
echo "🔍 Checking Python 3.9+..."
if command -v python3 &>/dev/null; then
  PY_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  PY_MAJOR=$(echo "$PY_VERSION" | cut -d. -f1)
  PY_MINOR=$(echo "$PY_VERSION" | cut -d. -f2)
  if [ "$PY_MAJOR" -ge 3 ] && [ "$PY_MINOR" -ge 9 ]; then
    echo "✅ Python $PY_VERSION found."
  else
    echo "⚠️  Python $PY_VERSION found but 3.9+ required. Installing..."
    brew install python@3.13
    echo "✅ Python 3.13 installed."
  fi
else
  echo "📦 Python not found. Installing via Homebrew..."
  brew install python@3.13
  echo "✅ Python 3.13 installed."
fi

# --- 5. Salesforce CLI ---
echo ""
echo "🔍 Checking Salesforce CLI..."
if command -v sf &>/dev/null; then
  SF_VERSION=$(sf --version 2>/dev/null | head -1)
  echo "✅ Salesforce CLI found ($SF_VERSION)."
else
  echo "📦 Salesforce CLI not found. Installing via npm..."
  npm install -g @salesforce/cli
  echo "✅ Salesforce CLI installed."
fi

# --- 6. SFDMU Plugin ---
echo ""
echo "🔍 Checking SFDMU plugin..."
if sf plugins --core 2>/dev/null | grep -q sfdmu; then
  echo "✅ SFDMU plugin found."
else
  echo "📦 Installing SFDMU plugin..."
  sf plugins install sfdmu
  echo "✅ SFDMU plugin installed."
fi

# --- 7. npm install ---
echo ""
echo "📦 Installing Node.js dependencies..."
npm install
echo "✅ Dependencies installed."

# --- 8. Verify .mcp.json ---
echo ""
if [ -f "$REPO_DIR/.mcp.json" ]; then
  echo "✅ .mcp.json found."
else
  echo "⚠️  .mcp.json not found — MCP servers won't be available."
  echo "   This file should exist in the repo. Check your clone."
fi

# --- 9. Slack MCP Registration ---
echo ""
echo "🔍 Checking Slack MCP registration..."
CLAUDE_JSON="$HOME/.claude.json"
if [ -f "$CLAUDE_JSON" ] && grep -q '"slack"' "$CLAUDE_JSON" 2>/dev/null; then
  echo "✅ Slack MCP already registered."
else
  echo "📦 Registering Slack MCP at user scope..."
  claude mcp add --scope user slack \
    --transport stdio \
    -- npx -y @anthropic/mcp-slack 2>/dev/null || {
    echo "⚠️  Slack MCP registration failed (non-fatal). You can add it later with:"
    echo "   claude mcp add --scope user slack --transport stdio -- npx -y @anthropic/mcp-slack"
  }
  echo "   Note: OAuth authentication happens inside a Claude Code session."
  echo "   Run /setup-lsdo-build after this script completes to authenticate."
fi

# --- 10. CumulusCI (optional) ---
echo ""
read -p "📦 Install CumulusCI? (recommended for data deployment) [y/N]: " INSTALL_CCI
if [[ "$INSTALL_CCI" =~ ^[Yy]$ ]]; then
  if command -v cci &>/dev/null; then
    echo "✅ CumulusCI already installed."
  else
    if ! command -v pipx &>/dev/null; then
      echo "   Installing pipx first..."
      brew install pipx
      pipx ensurepath
    fi
    echo "   Installing CumulusCI..."
    pipx install cumulusci
    echo "✅ CumulusCI installed."
  fi
else
  echo "   Skipping CumulusCI. Install later with: pipx install cumulusci"
fi

# --- 11. Community Skills Sync ---
echo ""
echo "📦 Syncing community skills..."
if [ -f "$REPO_DIR/.claude/scripts/sync-skills.sh" ]; then
  bash "$REPO_DIR/.claude/scripts/sync-skills.sh"
else
  echo "⚠️  sync-skills.sh not found. Community skills not synced."
fi

# --- 12. Create orgs/ directory ---
echo ""
if [ ! -d "$REPO_DIR/orgs" ]; then
  mkdir -p "$REPO_DIR/orgs"
  echo "✅ Created orgs/ directory."
else
  echo "✅ orgs/ directory exists."
fi

# --- Done ---
echo ""
echo "================================"
echo "✅ LSDO Build Template — Install complete!"
echo ""
echo "Next steps:"
echo "  1. Open this project in VS Code or Cursor"
echo "  2. Run /setup-lsdo-build to connect your demo org"
echo "  3. Run /scout-sparring to start building"
echo ""
echo "Available commands:"
echo "  /scout-sparring   — Opus discovery sparring + spec generation"
echo "  /scout-building   — Opus orchestrator for org deployment"
echo "  /switch-org       — Change active demo org"
echo "  /lsdo-readiness   — Check LSDO build best practices"
echo "  /lsdo-cci         — Generate CumulusCI config"
echo "  /lsdo-data        — Seed or extract demo data"
echo "  /lsdo-deploy      — Smart incremental deploy"
echo "  /lsdo-agent       — Build an Agentforce agent"
echo "  /lsdo-flow        — Build a flow interactively"
echo ""
