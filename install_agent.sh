#!/bin/bash
#
# install_agent.sh — Copia .cursor, .cursorrules, ai-team y STACK.md de ESTE repo al proyecto destino.
# NO copia README.md ni AGENTS.md (evitas pisar la documentación propia del otro proyecto).
#
# Uso (desde el proyecto destino):
#   cd "ruta/al/otro/proyecto"
#   bash "/ruta/completa/a/my-team/install_agent.sh"
#
# Sobrescribir archivos existentes en destino:
#   bash ".../install_agent.sh" --force
#
# En Windows: Git Bash o WSL. Rutas con espacios entre comillas.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_PATH="$SCRIPT_DIR"

FORCE=false
for arg in "$@"; do
  if [ "$arg" = "--force" ] || [ "$arg" = "-f" ]; then
    FORCE=true
  fi
done

echo "🚀 Installing Cursor AI stack..."

copy_if_missing() {
  local src="$1"
  local dest="$2"

  mkdir -p "$dest"

  if [ "$FORCE" = true ]; then
    if command -v rsync >/dev/null 2>&1; then
      rsync -av "$src/" "$dest/"
    else
      cp -R "$src/." "$dest/"
    fi
  else
    if command -v rsync >/dev/null 2>&1; then
      rsync -av --ignore-existing "$src/" "$dest/"
    else
      cp -Rn "$src/." "$dest/"
    fi
  fi
}

if [ ! -d "$BASE_PATH/.cursor" ]; then
  echo "❌ Error: .cursor not found in $BASE_PATH"
  exit 1
fi

if [ ! -d "$BASE_PATH/.cursorrules" ]; then
  echo "❌ Error: .cursorrules not found in $BASE_PATH"
  exit 1
fi

if [ ! -d "$BASE_PATH/ai-team" ]; then
  echo "❌ Error: ai-team not found in $BASE_PATH"
  exit 1
fi

if [ ! -f "package.json" ]; then
  echo "⚠️ Warning: No package.json found"
fi

mkdir -p .cursor
mkdir -p .cursorrules
mkdir -p ai-team

echo "📦 Copying .cursor..."
copy_if_missing "$BASE_PATH/.cursor" ".cursor"

echo "📦 Copying .cursorrules..."
copy_if_missing "$BASE_PATH/.cursorrules" ".cursorrules"

echo "📦 Copying ai-team..."
copy_if_missing "$BASE_PATH/ai-team" "ai-team"

# STACK.md (perfiles); no pisa destino salvo --force
copy_optional_root_file() {
  local f="$1"
  [ -f "$BASE_PATH/$f" ] || return 0
  if [ "$FORCE" = false ] && [ -f "./$f" ]; then
    echo "⏭️  Omitiendo $f (ya existe en destino; usa --force para sobrescribir)"
    return 0
  fi
  echo "📄 Copying $f..."
  cp "$BASE_PATH/$f" "./$f"
}
copy_optional_root_file "STACK.md"

if [ -d ".cursor" ] && [ -d ".cursorrules" ] && [ -d "ai-team" ]; then
  echo "✅ Installation successful"
else
  echo "❌ Installation failed"
  exit 1
fi

echo "🎉 Cursor AI ready"
