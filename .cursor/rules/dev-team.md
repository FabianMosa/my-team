All development must follow the AI Dev Team architecture.

## Mandatory pipeline

1. **Planner** defines the plan (`@planner`)
2. **Orchestrator** coordinates execution and **logs delegation in chat** (`@orchestrator`) — see `ai-team/orchestrator.md`
3. **Specialized agents (Dev)** implement (`@ux`, `@marketing`, `@content`, `@frontend`, `@styling`, `@backend`, `@db-dev`, …) según **perfil activo** (`STACK.md` si existe en el repo; si no, lo indicado en el mensaje del usuario)
4. **Integration** merges outputs (`@integration`) when needed
5. **Security Auditor** runs SecDevOps gates on all code (`@security-auditor`) — on failure, bounce to the Dev agent with the report
6. **Security Sentinel** audits OWASP-sensitive surfaces (`@security-sentinel`) **after** the auditor when APIs/DB/auth/user input apply
7. **Reviewer** validates and improves (`@reviewer`)

## Non-negotiables

- Never skip planning for non-trivial work.
- Never jump straight to implementation without an orchestration step (matrix + next agent).
- Never skip the **Security Auditor** for code that will ship; never skip the **Security Sentinel** for sensitive surfaces (APIs, DB, auth, user input) after the auditor passes.
- Respect tool guardrails: `scripts/security-tool-middleware.mjs` and `.cursor/hooks.json` (path blacklist, command sanitizer, no hardcoded credentials — use `process.env.*`).
