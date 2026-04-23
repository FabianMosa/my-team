# /delegate-db

Delegacion rapida para tareas de base de datos con skill obligatoria.

## Description

Genera un handoff directo para `@db-dev`, cubriendo esquema, migracion y seed con criterios verificables.

## Usage

/delegate-db [objetivo]

Opcional:
- `Riesgo: bajo|medio|alto`
- `Perfil activo: next-tailwind` (u otro de `STACK.md`)

## Prompt listo para pegar

```md
@db-dev
Objetivo: <modelo, tabla o relacion a implementar>.
Contexto: <feature/bug + restricciones de dominio>.
Skill obligatoria: .cursor/skills/database/create_schema.md
Skills complementarias (si aplica):
- .cursor/skills/database/create_migration.md
- .cursor/skills/database/create_seed.md
Entradas:
- <esquema actual o tablas relacionadas>
- <reglas de negocio>
Salida esperada:
- Esquema normalizado con llaves y relaciones.
- Migracion con up/down o estrategia equivalente segura.
- Seed minima realista para pruebas locales.
Criterio de done:
- Integridad referencial conservada.
- Indices necesarios en consultas criticas.
- Cambios compatibles con backend actual.
- Handoff a @orchestrator si impacta otros dominios.
```
