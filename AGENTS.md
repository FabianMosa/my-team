# AGENTS.md — AI Dev Team (Cursor)

Este documento resume **qué agentes existen en esta plantilla**, **en qué orden encajan** y **dónde está el detalle** de cada rol. Sirve como mapa rápido para personas y para asistentes que deban seguir el mismo flujo. Para instalación y scripts, ver también **`README.md`**; historial de versiones: **`CHANGELOG.md`**. **Índice de una página y orden de lectura:** **`START_HERE.md`**.

---

## Fuente única de verdad (SSOT)

Objetivo: **un sitio canónico por tema** y en el resto **remisiones breves**, para que la plantilla no derive entre copias del mismo pipeline o de los mismos perfiles.

| Tema | Canónico (editar aquí primero) | En otros archivos |
| ---- | ------------------------------- | ------------------- |
| Pipeline obligatorio y acortado, tabla de agentes, hooks `failClosed`, checklist pre-release | **Este `AGENTS.md`** | `.cursor/rules/dev-team.md`, `README.md`, `STACK.md`, comandos slash: solo enlaces o un párrafo de contexto. |
| Perfiles (`next-tailwind`, `design-ux`, `content-marketing`) y stack asumido al implementar | **`STACK.md`** | `@planner` / `@orchestrator`: citar perfil; no reescribir la tabla de perfiles entera. |
| Formato de salida del orquestador, matriz, “próximo mensaje” | **`ai-team/orchestrator.md`** | `AGENTS.md`: mención y enlace (ya hecho arriba). |
| Criterios SecDevOps del auditor / sentinel | **`ai-team/security-auditor.md`**, **`ai-team/security-sentinel.md`** | Alineados con `scripts/security-tool-middleware.mjs` donde aplique la misma política. |
| Reglas mínimas en Cursor (no negociable) | **`.cursor/rules/dev-team.md`** | Debe remitir aquí para el detalle del pipeline; no duplicar listas largas de pasos. |
| Política ejecutable (rutas, shell, denegaciones) | **`scripts/security-tool-middleware.mjs`** | Hooks: **`.cursor/hooks.json`** + **`.cursor/hooks/secdevops-guardrails.mjs`** (sin redefinir listas de bloqueo en markdown). |
| Instalación, scripts `npm`, alcance “plantilla vs app” | **`README.md`** | `examples/README.md`: caso consumidor; no repetir toda la tabla de scripts salvo un resumen. |

**Regla práctica:** si añades un paso nuevo al pipeline o un agente, actualiza **primero** `AGENTS.md` (y `ai-team/<rol>.md` si hay definición de rol); después ajusta enlaces en `README.md`, `START_HERE.md` o `.cursor/commands/build-feature.md` solo si el flujo visible para el usuario cambia.

---

## Pipeline obligatorio

Orden lógico del trabajo (no saltar planificación ni orquestación en tareas no triviales):

1. **`@planner`** — Plan estructurado (arquitectura + tareas + handoff al orquestador).
2. **`@orchestrator`** — Coordina con **MATRIZ DE DELEGACIÓN** y **PRÓXIMO MENSAJE** visible en el chat (ver `ai-team/orchestrator.md`).
3. **Subagentes Dev (especialistas)** — Según el feature y el **perfil activo** (`STACK.md` o texto del usuario: *Perfil activo: …*): `@frontend`, `@backend`, `@db-dev`, `@styling`, `@ux`, `@marketing`, `@content`, `@integration`, etc.
4. **`@integration`** — Unifica salidas entre carpetas/ramas de trabajo cuando haga falta (sigue siendo Dev-side hasta el auditor).
5. **`@security-auditor`** — **SecDevOps obligatorio** para todo **código** generado: simula o pide `npm audit`, reglas tipo `eslint-plugin-security`, barrido de secretos; si falla, **rebote al Dev** con informe (ver `ai-team/security-auditor.md`).
6. **`@security-sentinel`** — Revisión OWASP / arquitectura **después** del auditor y **antes** del revisor cuando hay **APIs, auth, base de datos o entrada de usuario**.
7. **`@reviewer`** — Calidad, coherencia y confirmación de paso por **auditor** (código) y **sentinel** (superficies sensibles) si aplica.

Reglas mínimas en Cursor: `.cursor/rules/dev-team.md` (remiten aquí). Lista corta de roles: `.cursor/rules/roles.md`. Guardrails automáticos (rutas, shell, herramientas): `scripts/security-tool-middleware.mjs` + `.cursor/hooks.json`.

---

## Pipeline acortado (tareas triviales)

El pipeline completo aplica a **features, refactors amplios, API/DB/auth o cualquier cambio no trivial**. Para trabajo **trivial** puedes acortar el flujo si el riesgo es bajo:

| Situación típica | Qué basta |
| ----------------- | ---------- |
| Typo en doc o comentario, un string de UI sin lógica | Implementación directa; sin matriz de orquestador. |
| Ajuste de formato / lint auto, rename local sin comportamiento | Mismo agente o humano; sin `@planner` si ya está claro. |
| Cambio de una línea en config de tooling del repo | `@security-auditor` opcional si no toca secretos ni red; si dudas, audita. |

**Sigue siendo obligatorio** el pipeline completo (incl. `@security-auditor` y `@security-sentinel` cuando aplique) si hay: nueva API, consultas SQL, auth, manejo de archivos/subidas, cifrado, permisos, o datos de usuario.

---

## Hooks SecDevOps (`failClosed`)

En `.cursor/hooks.json`, `preToolUse` y `beforeShellExecution` usan **`failClosed: true`**: si el script del hook **no llega a ejecutarse** (Node ausente, ruta incorrecta, error antes de responder), Cursor tiende a **denegar** la herramienta en lugar de permitirla a ciegas.

El script `secdevops-guardrails.mjs` ante JSON inválido responde **allow** (compatibilidad con eventos desconocidos); ante política violada responde **deny**. Si un entorno bloquea demasiado, revisa que `node` esté en PATH y la ruta `.cursor/hooks/secdevops-guardrails.mjs` sea válida desde la raíz del workspace.

---

## Catálogo de agentes

| Agente | Rol breve | Definición completa |
| ------ | --------- | ------------------- |
| `@planner` | Desglosa requisitos en plan ejecutable | `ai-team/planner.md` |
| `@orchestrator` | Delega sin implementar código de app | `ai-team/orchestrator.md` |
| `@ux` | Flujos, estados vacío/error, a11y | `ai-team/ux.md` |
| `@marketing` | Mensaje, posicionamiento, activos de conversión | `ai-team/marketing.md` |
| `@content` | Copy y microcopy finales | `ai-team/content.md` |
| `@frontend` | UI cliente / páginas / componentes (dominio front) | `ai-team/frontend.md` |
| `@styling` | Tailwind, patrones visuales, consistencia UI | `ai-team/styling.md` |
| `@backend` | API routes, lógica de servidor | `ai-team/backend.md` |
| `@db-dev` | Esquema, migraciones, seeds | `ai-team/db-dev.md` |
| `@integration` | Ensamblar cambios entre partes del repo | `ai-team/integration.md` |
| `@security-auditor` | SecDevOps previo a persistencia/revisor (npm audit, eslint-security, secretos, rebote a Dev) | `ai-team/security-auditor.md` |
| `@security-sentinel` | Auditoría profunda OWASP / superficies sensibles | `ai-team/security-sentinel.md` |
| `@reviewer` | Revisión final y mejoras | `ai-team/reviewer.md` |

Cada especialista debe **quedarse en su dominio**; si el trabajo se sale del rol, parar y devolver el control a `@orchestrator` con un bloque **Handoff** (como indica `roles.md`).

---

## Perfiles de stack (`STACK.md`)

Los perfiles (`next-tailwind`, `design-ux`, `content-marketing`, …) definen **qué agentes suelen entrar** y **qué stack asumir** al planificar. El `@planner` debe reflejar el perfil en **PLAN → Architecture**.

- Detalle y plantillas de mensajes: **`STACK.md`**
- Atajo en Cursor: comando **`/build-feature`** (`.cursor/commands/build-feature.md`)

---

## Orquestador: salida visible

Si no ves matriz ni “próximo mensaje”, pide explícitamente que se use el formato de `ai-team/orchestrator.md`. Secciones esperadas (títulos fijos): **RESUMEN**, **MATRIZ DE DELEGACIÓN**, **ESTADO DEL PIPELINE**, **PRÓXIMO MENSAJE**, **RIESGOS / BLOQUEADORES**, etc.

---

## Memoria opcional (Engram MCP)

Si en el workspace está configurado **Engram** (`.cursor/mcp.json`), el orquestador puede usar herramientas `mem_*` para buscar contexto previo y guardar decisiones. Si no hay Engram, el flujo continúa sin bloquearse (`ai-team/orchestrator.md`).

### Troubleshooting Engram

- **El servidor MCP no arranca:** comprobar que el ejecutable `engram` exista en PATH (la config usa `"command": "engram"` con args `["mcp"]`).
- **Sin herramientas mem_:** revisar en Cursor que el MCP esté habilitado para el workspace; sin Engram no es bloqueante.
- **Credenciales:** no guardar secretos en memoria MCP; solo decisiones de arquitectura o contexto no sensible.

---

## Checklist pre-release (mantenedores)

Antes de subir una etiqueta de versión o publicar un zip de la plantilla:

1. `npm run secdevops:selftest` y `npm test` en verde.
2. Revisar `.cursor/hooks.json` y que los paths del hook sean válidos en Windows y Unix.
3. Actualizar `CHANGELOG.md` y el campo `version` en `package.json`.
4. Revisar que **`START_HERE.md`** enlaza correctamente a los documentos canónicos (sección SSOT) y que no hay contradicciones con este archivo.
5. Hacer un `setup:cursor` de prueba hacia una carpeta temporal (opcional: con `--with-docs`) y abrir el proyecto en Cursor.

---

## Skills por dominio (referencia)

Bajo `.cursor/skills/` hay guías reutilizables (p. ej. `frontend/`, `backend/`, `database/`, `styling/`, `review/`). El agente correspondiente o el usuario pueden citar la skill al delegar tareas concretas.

Para estandarizar delegaciones con **skill obligatoria + salida verificable**, usa el comando **`/delegate-with-skills`** (`.cursor/commands/delegate-with-skills.md`).
Si necesitas velocidad operativa, usa los atajos por dominio: **`/delegate-backend`**, **`/delegate-frontend`**, **`/delegate-styling`**, **`/delegate-db`**, **`/delegate-review`** y **`/delegate-orchestrator`**.
Si quieres decidir automaticamente el mejor atajo segun objetivo, usa **`/delegate-auto`** (`.cursor/commands/delegate-auto.md`).
