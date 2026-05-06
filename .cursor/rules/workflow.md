Execution workflow:

- Always start by analyzing the request
- Break work into tasks
- Assign tasks to the correct agent
- **Surface delegation in the chat**: the orchestrator (or the active coordinator) must always expose a **delegation matrix** and the **next `@agent` message** to copy/paste
- Validate outputs before continuing

## Priority order

Planner → Orchestrator → Specialized Dev agents (incl. `@ui-engineer` / `@marketing` / `@content` cuando el perfil lo requiera; perfil en `STACK.md` si está en el repo o en el mensaje) → Integration (si aplica) → **Security Auditor** → Security Sentinel (solo APIs/DB/auth/input) → Reviewer

## Operational rules

- **No agent** should perform tasks outside its strictly defined responsibility.
- **Visible handoffs:** If you are acting as `@orchestrator`, you **must** include the mandatory sections defined in `ai-team/orchestrator.md` (matrix, pipeline state, next message).
- **Security checkpoint (code):** All implementation output MUST pass `@security-auditor` before `@reviewer`; High/Critical findings bounce to the Dev agent automatically via the orchestrator.
- **Security checkpoint (sensitive surfaces):** API routes, database queries, or user inputs MUST also pass `@security-sentinel` after the auditor and before the Reviewer signs off.
- **Final approval:** The Reviewer must confirm auditor/sentinel remediation (or explicit waiver with justification — rare).

## Single-chat reality (important)

Cursor does not spawn separate “subagent chat windows” for `@ui-engineer` / `@backend` by default. **Delegation is enforced by prompts + your visible sections.** If the user wants strict isolation, they should send **one message per agent** using the “PRÓXIMO MENSAJE” block from the orchestrator.
