#!/bin/bash
<<<<<<< HEAD
# Instala .cursor, .cursorrules, ai-team (+ STACK.md y AGENTS.md si no existen en destino).
# Uso (desde el proyecto destino): bash /ruta/a/my-team/install_agent.sh
# Sobrescribir archivos existentes: bash .../install_agent.sh --force
=======
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
>>>>>>> 373e5f6e4b33423c3b449dae4f7fec23299eeb57

set -e

# Ruta base: carpeta donde vive este script (evita rutas hardcodeadas)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_PATH="$SCRIPT_DIR"

# --force : sobrescribe archivos existentes en destino (útil para actualizar la plantilla)
FORCE=false
for arg in "$@"; do
  if [ "$arg" = "--force" ] || [ "$arg" = "-f" ]; then
    FORCE=true
  fi
done

echo "🚀 Installing Cursor AI stack..."

# Copia recursiva: sin force no pisa archivos que ya existan en destino
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
<<<<<<< HEAD
=======

>>>>>>> 373e5f6e4b33423c3b449dae4f7fec23299eeb57

# Copia inteligente (NO sobreescribe)
echo "📦 Copying .cursor..."
copy_if_missing "$BASE_PATH/.cursor" ".cursor"

<<<<<<< HEAD
=======

>>>>>>> 373e5f6e4b33423c3b449dae4f7fec23299eeb57
echo "📦 Copying .cursorrules..."
copy_if_missing "$BASE_PATH/.cursorrules" ".cursorrules"

echo "📦 Copying ai-team..."
copy_if_missing "$BASE_PATH/ai-team" "ai-team"
<<<<<<< HEAD

# Documentación de equipo (no pisa si ya existe, salvo --force)
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
for f in STACK.md AGENTS.md; do copy_optional_root_file "$f"; done

# Validación
if [ -d ".cursor" ] && [ -d ".cursorrules" ] && [ -d "ai-team" ]; then
=======
# Validación
if [ -d ".cursor" ] && [ -d ".cursorrules" ] && [ -d "ai-team" ] ; then
>>>>>>> 373e5f6e4b33423c3b449dae4f7fec23299eeb57
  echo "✅ Installation successful"
else
  echo "❌ Installation failed"
  exit 1
fi

echo "🎉 Cursor AI ready"
