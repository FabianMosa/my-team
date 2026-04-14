# Changelog

Todas las notas relevantes por versión de la plantilla **my-team-cursor-template**.

El formato es inspirado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/).

## [1.4.2] - 2026-04-14

### Añadido

- **`START_HERE.md`**: índice de una página (orden de lectura, tabla SSOT, atajos).
- **`AGENTS.md`**: sección **Fuente única de verdad** y punto extra en checklist pre-release para revisar coherencia con `START_HERE.md`.

### Cambiado

- **`README.md`**, **`STACK.md`**, **`.cursor/rules/dev-team.md`**, **`.cursor/commands/build-feature.md`**, **`examples/README.md`**: enlaces y remisiones al índice y a documentos canónicos (sin duplicar el pipeline largo).
- **`scripts/setup-cursor.cjs`** y **`install_agent.sh`**: copian **`START_HERE.md`** al destino junto con `STACK.md` (merge seguro / `--force`).

## [1.4.1] - 2026-04-14

### Añadido

- `scripts/setup-cursor.cjs`: flag **`--with-docs`** para copiar `README.md`, `AGENTS.md` y `CHANGELOG.md` al destino (merge seguro; respeta `--force`).

### Cambiado

- Documentación (`README.md`, `examples/README.md`, `STACK.md`, `AGENTS.md`) actualizada para describir `--with-docs`.

## [1.4.0] - 2026-04-14

### Añadido

- `README.md` de onboarding (alcance de la plantilla, scripts, enlaces a documentación).
- `CHANGELOG.md` y checklist pre-release en `AGENTS.md`.
- Tests con `node:test` en `scripts/security-tool-middleware.test.mjs`; script `npm test`.
- `examples/README.md` orientación para proyectos consumidores.
- Secciones en `AGENTS.md`: pipeline acortado, política de hooks (`failClosed`), troubleshooting Engram.

### Cambiado

- `.gitignore`: dejan de ignorarse `README.md` y `AGENTS.md` para versionar documentación en el repo.
- `.cursor/hooks.json`: `failClosed: true` en `preToolUse` y `beforeShellExecution` (si el hook falla de forma anómala, Cursor tiende a denegar en lugar de permitir).
- `.cursor/rules/dev-team.md`: reglas mínimas con remisión a `AGENTS.md` como fuente detallada del pipeline.
- `scripts/security-tool-middleware.mjs`: export de `runSelfTestSuite()` compartida entre selftest y tests.

### [1.3.0] y anteriores

- Versiones previas sin changelog consolidado; ver historial de Git si aplica.

