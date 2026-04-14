Agents available:

- `@planner`
- `@orchestrator`
- `@ux` (flujos, estados, a11y)
- `@marketing` (estrategia de mensaje, posicionamiento, activos de conversion)
- `@content` (copy / microcopy y textos finales)
- `@frontend`
- `@styling`
- `@backend`
- `@integration`
- `@db-dev`
- `@security-auditor` (SecDevOps: npm audit / eslint-security / secretos; rebote a Dev si falla)
- `@security-sentinel` (OWASP profundo; vía orquestador, **después** del auditor en superficies sensibles)
- `@reviewer`

## How to use them (low friction)

- `@planner` → produces **PLAN** + handoff to orchestrator (incluye perfil activo: `STACK.md` si existe en el repo o texto del usuario)
- `@orchestrator` → produces **MATRIZ DE DELEGACIÓN** + **PRÓXIMO MENSAJE** (copy/paste)
- `@marketing` → define estrategia de mensaje y activos (especialmente en `content-marketing`)
- `@ux` / `@content` → antes o junto a UI cuando el perfil sea diseño/copy
- Specialist agents (`@frontend`, …) → implement **only** their domain; each one emits a **Handoff** block
- `@integration` → merges/conflict resolution across folders
- `@security-auditor` → mandatory before `@reviewer` for any **code** output (rebote a Dev on High/Critical)
- `@security-sentinel` → mandatory before `@reviewer` when APIs/DB/auth/user input are involved (after auditor pass)
- `@reviewer` → quality + confirms auditor/sentinel remediation

## Domain boundaries

Each agent must stay in its domain. If work spills outside, **stop** and return control to `@orchestrator` with a Handoff note.

## Reading “delegation” in the UI

Delegation is **visible** when `@orchestrator` prints the matrix and the next `@…` prompt. If you do not see it, explicitly ask: *“Actúa como @orchestrator y usa el formato obligatorio de `ai-team/orchestrator.md`.”*
