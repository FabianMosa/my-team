# Perfiles de proyecto (stack)

**Entrada al repo:** `START_HERE.md`. **Pipeline (orden de agentes):** `AGENTS.md` (canónico). Este archivo es el **canónico de perfiles y stack** al planificar e implementar.

Este archivo define **perfiles de trabajo** para el flujo **AI Dev Team** de este repo. El `@planner` y el `@orchestrator` deben leerlo y ajustar tareas **sin mezclar stacks**.

## Qué es este repositorio (contexto)

- **Plantilla Cursor:** reglas (`.cursor/rules/`), skills (`.cursor/skills/`), agentes en `ai-team/*.md` y comando slash `/build-feature` (ver `.cursor/commands/build-feature.md`).
- **Setup:** scripts Node en `package.json` → `npm run setup:cursor` / `setup:cursor:force` (`scripts/setup-cursor.cjs`). Copia siempre `STACK.md` y **`START_HERE.md`** al destino; opcional **`--with-docs`** en la misma línea que el destino copia `README.md`, `AGENTS.md` y `CHANGELOG.md`. Tests del middleware: `npm test`; autochequeo rápido: `npm run secdevops:selftest`.
- **MCP opcional:** memoria persistente **Engram** configurada en `.cursor/mcp.json` (útil para decisiones y contexto entre sesiones).
- **Importante:** aquí no vive obligatoriamente una app Next.js; el **perfil A** describe el stack **típico** cuando construyes una web con las skills incluidas (Next, JS, Tailwind).

---

## Perfil A — `next-tailwind` (por defecto para apps web con esta plantilla)

- **Stack objetivo al implementar:** Next.js, JavaScript, Tailwind CSS (skills bajo `.cursor/skills/frontend`, `styling`, `backend`, etc.).
- **Pipeline típico:** `@planner` → `@orchestrator` → especialistas Dev (`@ui-engineer`, `@marketing`, `@content`, `@backend`, `@db-dev`, … según el feature) → `@integration` (si aplica) → `@security-auditor` (todo código) → `@security-sentinel` (solo si API/DB/auth/input de usuario) → `@reviewer`.
- **Cuándo:** aplicaciones web que quieras alinear con las convenciones de las skills del repo.

## Perfil B — `design-ux` (producto / diseño de experiencia)

- **Enfoque:** flujos, jerarquía, estados vacíos/error, accesibilidad, microcopy de UI.
- **Agentes típicos:** `@ui-engineer`; `@content` para textos finales.
- **Cuándo:** proyectos donde el riesgo principal es **claridad y usabilidad**, no solo código.

## Perfil C — `content-marketing` (go-to-market y copy)

- **Enfoque:** estrategia de mensaje, posicionamiento, estructura de activos de marketing, SEO on-page (sin prometer rankings).
- **Agentes típicos:** `@marketing` → `@content` → `@reviewer` (calidad editorial); código mínimo o ninguno.
- **Cuándo:** landings, decks de copy, emails, campañas y páginas de conversión (como documentos en repo).
