# my-team — plantilla AI Dev Team (Cursor)

Repositorio **plantilla**: reglas, skills, agentes y guardrails SecDevOps para trabajar en Cursor con un flujo reproducible (plan → orquestación → especialistas → seguridad → revisión). **No incluye** una aplicación Next.js ni runtime de producto; el stack web se describe en `STACK.md` para cuando generes código en otro repo o carpeta.

**Primera vez en el repo:** lee el índice de una página en **`START_HERE.md`** (orden de lectura y política de fuente única de verdad).

## Inicio rápido

1. Clona o copia este repo.
2. Instala la plantilla en un proyecto destino (por ejemplo tu app Next):

   ```bash
   cd tu-proyecto
   node ruta/a/my-team/scripts/setup-cursor.cjs .
   ```

   O desde la raíz de esta plantilla:

   ```bash
   npm run setup:cursor -- "C:\ruta\destino"
   ```

   Usa `npm run setup:cursor:force` solo si quieres **sobrescribir** `.cursor/`, `.cursorrules/` y `ai-team/` ya existentes.

   Para copiar también **`README.md`**, **`AGENTS.md`** y **`CHANGELOG.md`** al destino (misma lógica merge/`--force` que `STACK.md`):

   ```bash
   npm run setup:cursor -- "C:\ruta\destino" --with-docs
   ```

3. Lee **`START_HERE.md`** (mapa rápido), luego el pipeline en **`AGENTS.md`** y los perfiles en **`STACK.md`**.

4. En Cursor, el comando slash **`/build-feature`** (definido en `.cursor/commands/build-feature.md`) arranca el flujo documentado.

## Scripts útiles (`package.json`)

| Script | Descripción |
| ------ | ----------- |
| `npm run setup:cursor` | Copia `.cursor`, `.cursorrules`, `ai-team`, `STACK.md` y `START_HERE.md` al destino. Añade `--with-docs` tras el destino para README/AGENTS/CHANGELOG. |
| `npm run secdevops:selftest` | Autochequeo rápido del middleware de políticas. |
| `npm test` | Tests del middleware (`node --test`). |

## Documentación clave

- **`START_HERE.md`** — Índice de una página: orden de lectura y tabla SSOT (qué archivo es canónico por tema).
- **`AGENTS.md`** — **Canónico del pipeline:** orden de agentes, cuándo acortar el flujo, hooks, checklist de release; sección **Fuente única de verdad** para mantenedores.
- **`STACK.md`** — **Canónico de perfiles** (`next-tailwind`, `design-ux`, `content-marketing`).
- **`CHANGELOG.md`** — Historial de versiones de la plantilla.
- **`examples/README.md`** — Cómo usar la plantilla sin un monorepo de ejemplo embebido.

## Seguridad y MCP

- Política técnica: `scripts/security-tool-middleware.mjs` y hooks en `.cursor/hooks.json`.
- Memoria opcional **Engram**: `.cursor/mcp.json` (requiere el binario `engram` en PATH); si no está, el flujo sigue sin memoria persistente.

## Versión

Versión actual en `package.json` (campo `version`). Antes de etiquetar un release, ver checklist en `AGENTS.md`.
