#!/bin/bash
#
# install_agent.sh — Copia .cursor y .cursorrules de ESTE repo al proyecto destino.
#
# CÓMO USARLO (el destino es siempre el directorio actual de la terminal):
#   1. cd "ruta/al/otro/proyecto"
#   2. bash "/ruta/completa/a/my-team/install_agent.sh"
#
# En Windows: ejecutar desde Git Bash o WSL (PowerShell/CMD no interpretan .sh).
# Rutas con espacios: van entre comillas en el comando bash.
#
# Comportamiento:
#   - Origen: carpetas .cursor y .cursorrules junto a este script (my-team).
#   - Destino: . (carpeta donde hiciste cd).
#   - No sobrescribe archivos que ya existan en el destino.
#
# Si no hay package.json en el destino solo aparece un aviso; la copia continúa.

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

if [ ! -d "$BASE_PATH/ai-team" ]; then
  echo "❌ Error: ai-team not found in $BASE_PATH"
  exit 1
fi

# Validar proyecto
if [ ! -f "package.json" ]; then
  echo "⚠️ Warning: No package.json found"
fi

# Crear carpetas si no existen
mkdir -p .cursor
mkdir -p .cursorrules
mkdir -p ai-team


# Copia inteligente (NO sobreescribe)
echo "📦 Copying .cursor..."
copy_if_missing "$BASE_PATH/.cursor" ".cursor"


echo "📦 Copying .cursorrules..."
copy_if_missing "$BASE_PATH/.cursorrules" ".cursorrules"

echo "📦 Copying ai-team..."
copy_if_missing "$BASE_PATH/ai-team" "ai-team"
# Validación
if [ -d ".cursor" ] && [ -d ".cursorrules" ] && [ -d "ai-team" ] ; then
  echo "✅ Installation successful"
else
  echo "❌ Installation failed"
  exit 1
fi

echo "🎉 Cursor AI ready"
