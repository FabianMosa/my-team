# Empieza aquí — índice de una página

Este repo es una **plantilla Cursor** (agentes, reglas, skills, hooks SecDevOps). **No** es una aplicación web ejecutable; el producto lo construyes en otro repositorio o carpeta usando el mismo flujo.

---

## Orden de lectura recomendado

| Paso | Archivo | Para qué sirve |
| ---- | ------- | ---------------- |
| 1 | **`START_HERE.md`** (esta página) | Orientación y enlaces sin perderse. |
| 2 | **`README.md`** | Instalación (`setup:cursor`), scripts `npm`, alcance de la plantilla. |
| 3 | **`AGENTS.md`** | **Canónico del pipeline** (obligatorio / acortado), catálogo de agentes, hooks, checklist release. |
| 4 | **`STACK.md`** | **Canónico de perfiles** (`next-tailwind`, `design-ux`, `content-marketing`) y contexto de stack al planificar. |
| 5 | **`ai-team/*.md`** | Definición operativa de cada rol (orquestador, planner, seguridad, etc.). |
| 6 | **`.cursor/commands/build-feature.md`** | Comando slash **`/build-feature`** en Cursor. |
| 7 | **`.cursor/commands/delegate-with-skills.md`** | Plantillas para delegar con skill obligatoria por agente. |
| 8 | **`.cursor/commands/delegate-*.md`** | Delegación rápida por dominio (`backend`, `frontend`, `styling`, `db`, `review`, `orchestrator`). |
| 9 | **`.cursor/commands/delegate-auto.md`** | Router para recomendar el mejor comando de delegación según objetivo. |

Si solo vas a **instalar la plantilla en tu app**: lee `README.md` → ejecuta `npm run setup:cursor` → abre tu proyecto en Cursor y usa **`/build-feature`**.

---

## Fuente única de verdad (resumen)

Evita duplicar listas largas en varios sitios. Si cambias algo, hazlo en el archivo **canónico** y deja en el resto **enlaces cortos**.

| Tema | Documento canónico |
| ---- | -------------------- |
| Orden del pipeline (completo y acortado) | **`AGENTS.md`** |
| Perfiles de trabajo y stack asumido | **`STACK.md`** |
| Comportamiento de un agente concreto | **`ai-team/<rol>.md`** |
| Reglas mínimas para el modelo en Cursor | **`.cursor/rules/dev-team.md`** + lista de roles en **`.cursor/rules/roles.md`** |
| Política técnica (rutas, shell, herramientas) | **`scripts/security-tool-middleware.mjs`** (consumido por `.cursor/hooks/secdevops-guardrails.mjs`) |
| Configuración de hooks | **`.cursor/hooks.json`** |
| Historial de versiones de la plantilla | **`CHANGELOG.md`** |

El detalle para **mantenedores** de esta política está en la sección *Fuente única de verdad* de **`AGENTS.md`**.

---

## Atajos útiles

- **Instalar en otro proyecto:** `npm run setup:cursor -- "ruta\al\destino"` (opcional: `--force`, `--with-docs`). Ver **`README.md`**.
- **Comprobar políticas:** `npm run secdevops:selftest` y **`npm test`**.
- **Flujo de feature en el editor:** comando **`/build-feature`** (ver **`.cursor/commands/build-feature.md`**).
- **Delegación robusta por dominio:** comando **`/delegate-with-skills`** (ver **`.cursor/commands/delegate-with-skills.md`**).
- **Delegación directa por rol:** comandos **`/delegate-backend`**, **`/delegate-frontend`**, **`/delegate-styling`**, **`/delegate-db`**, **`/delegate-review`**, **`/delegate-orchestrator`**.
- **Ruteo automático de delegación:** comando **`/delegate-auto`** (ver **`.cursor/commands/delegate-auto.md`**).

---

## Siguiente paso

Abre **`AGENTS.md`** para ver el pipeline completo y cuándo acortarlo; luego **`STACK.md`** para alinear el perfil activo con tu tarea.
