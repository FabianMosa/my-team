#!/bin/bash

set -e

# Ruta base: carpeta donde vive este script (evita rutas hardcodeadas)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_PATH="$SCRIPT_DIR"

echo "🚀 Installing Cursor AI stack..."

# Función de copia: usa rsync si existe; si no, usa cp -n (no sobreescribe)
copy_if_missing() {
  local src="$1"
  local dest="$2"

  mkdir -p "$dest"

  if command -v rsync >/dev/null 2>&1; then
    rsync -av --ignore-existing "$src/" "$dest/"
  else
    # Copia recursiva sin sobrescribir archivos existentes
    cp -Rn "$src/." "$dest/"
  fi
}

# Validar existencia
if [ ! -d "$BASE_PATH/.cursor" ]; then
  echo "❌ Error: .cursor not found in $BASE_PATH"
  exit 1
fi

if [ ! -d "$BASE_PATH/.cursorrules" ]; then
  echo "❌ Error: .cursorrules not found in $BASE_PATH"
  exit 1
fi

# Validar proyecto
if [ ! -f "package.json" ]; then
  echo "⚠️ Warning: No package.json found"
fi

# Crear carpetas si no existen
mkdir -p .cursor
mkdir -p .cursorrules


# Copia inteligente (NO sobreescribe)
echo "📦 Copying .cursor..."
copy_if_missing "$BASE_PATH/.cursor" ".cursor"


echo "📦 Copying cursorules..."
copy_if_missing "$BASE_PATH/.cursorrules" ".cursorrules"


# Validación
if [ -d ".cursor" ] && [ -d "ai-team" ]; then
  echo "✅ Installation successful"
else
  echo "❌ Installation failed"
  exit 1
fi

echo "🎉 Cursor AI ready"