/**
 * Copia la plantilla AI Dev Team desde la raíz de este repo hacia un proyecto destino.
 * Por defecto no sobrescribe archivos ya existentes en destino (merge seguro).
 *
 * Copia STACK.md al destino (merge seguro). No copia README.md ni AGENTS.md.
 *
 * Uso:
 *   node scripts/setup-cursor.cjs [rutaDestino] [--force]
 *
 * Ejemplos:
 *   cd mi-proyecto-next && node ../my-team/scripts/setup-cursor.cjs .
 *   node scripts/setup-cursor.cjs "C:\ruta\hoteleria"
 */

const fs = require("fs");
const path = require("path");

const templateRoot = path.resolve(__dirname, "..");
const dirsToCopy = [".cursor", ".cursorrules", "ai-team"];
/** Perfiles: no pisa destino salvo --force */
const optionalRootFiles = ["STACK.md"];

function parseArgs(argv) {
  let force = false;
  const positional = [];
  for (const a of argv) {
    if (a === "--force" || a === "-f") force = true;
    else if (!a.startsWith("-")) positional.push(a);
  }
  const destRoot =
    positional.length > 0 ? path.resolve(positional[0]) : process.cwd();
  return { destRoot, force };
}

function assertTemplate() {
  for (const d of dirsToCopy) {
    const p = path.join(templateRoot, d);
    if (!fs.existsSync(p)) {
      console.error(`❌ Falta carpeta en plantilla: ${d} (${p})`);
      process.exit(1);
    }
  }
}

function copyRecursive(src, dest, force) {
  const stat = fs.statSync(src);
  if (stat.isDirectory()) {
    fs.mkdirSync(dest, { recursive: true });
    for (const name of fs.readdirSync(src)) {
      copyRecursive(path.join(src, name), path.join(dest, name), force);
    }
    return;
  }
  fs.mkdirSync(path.dirname(dest), { recursive: true });
  if (!force && fs.existsSync(dest)) return;
  fs.copyFileSync(src, dest);
}

function main() {
  const { destRoot, force } = parseArgs(process.argv.slice(2));
  assertTemplate();

  console.log(
    `🚀 Instalando plantilla Cursor → ${destRoot}${force ? " (force: sobrescribe)" : ""}`
  );

  for (const d of dirsToCopy) {
    const from = path.join(templateRoot, d);
    const to = path.join(destRoot, d);
    console.log(`📦 Copiando ${d}/ …`);
    copyRecursive(from, to, force);
  }

  for (const file of optionalRootFiles) {
    const from = path.join(templateRoot, file);
    if (!fs.existsSync(from)) continue;
    const to = path.join(destRoot, file);
    if (!force && fs.existsSync(to)) {
      console.log(
        `⏭️  Omitiendo ${file} (ya existe en destino; usa --force para sobrescribir)`
      );
      continue;
    }
    console.log(`📄 Copiando ${file} …`);
    fs.copyFileSync(from, to);
  }

  const ok = dirsToCopy.every((d) => fs.existsSync(path.join(destRoot, d)));
  if (!ok) {
    console.error("❌ Instalación incompleta.");
    process.exit(1);
  }
  console.log(
    "✅ Listo. Revisa .cursor/settings.json y STACK.md. (README / AGENTS no se copian.)"
  );
}

main();
