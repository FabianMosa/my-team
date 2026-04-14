# AI Dev Team — regla corta

La definición **completa** del pipeline, agentes, cuándo acortar el flujo, hooks y checklist de release está en **`AGENTS.md`** (raíz del repo). Aquí solo fijamos lo no negociable para el modelo.

## No negociable

- Sigue el pipeline y roles descritos en `AGENTS.md` y en `ai-team/*.md`.
- No planificar ni orquestar a la ligera en trabajo **no trivial** (ver sección “Pipeline acortado” en `AGENTS.md`).
- Código que vaya a producción: pasar por **`@security-auditor`**; superficies sensibles (API, DB, auth, input usuario): también **`@security-sentinel`** después del auditor, como indica `AGENTS.md`.
- Respeta guardrails: `scripts/security-tool-middleware.mjs` y `.cursor/hooks.json` (rutas sensibles, sanitizer de shell, sin credenciales en claro — usar `process.env.*`).
