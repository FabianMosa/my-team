# /delegate-with-skills

Guía práctica para delegar a agentes y subagentes usando skills explícitas (sin dejarlo al azar).

## Description

Estandariza handoffs para que cada rol use la skill correcta, con entregables claros y criterio de done verificable.

## Usage

/delegate-with-skills [objetivo]

Opcional al inicio:
- `Perfil activo: next-tailwind` (u otro de `STACK.md`)
- `Riesgo: bajo|medio|alto`
- `Dominio: frontend|backend|db|styling|review|repo`

## Plantilla base (copiar y completar)

```md
@<agente>
Objetivo: <qué se debe lograr>
Contexto: <feature/bug, restricciones, decisiones previas>
Skill obligatoria: .cursor/skills/<dominio>/<skill>.md
Entradas:
- <archivo o endpoint actual>
- <regla o contrato relevante>
Salida esperada:
- <cambios concretos>
- <evidencia: tests/lint/audit>
Criterio de done:
- <condición verificable 1>
- <condición verificable 2>
Handoff:
- Si sales de dominio, devuelve control a @orchestrator con bloque Handoff.
```

## Plantillas rápidas por dominio

### Backend API

```md
@backend
Objetivo: crear/ajustar endpoint para <caso>.
Skill obligatoria: .cursor/skills/backend/create_api_route.md
Complementaria (si aplica): .cursor/skills/backend/add_validation.md
Salida esperada:
- Ruta API implementada con validación.
- Manejo de errores consistente.
- Test del caso feliz y fallo principal.
Done:
- Contrato de request/response documentado en código.
- Sin regresiones en tests relacionados.
```

### Frontend componente/página

```md
@frontend
Objetivo: implementar UI de <pantalla/flujo>.
Skill obligatoria: .cursor/skills/frontend/create_component.md
Complementaria (si aplica): .cursor/skills/frontend/create_next_page.md
Salida esperada:
- Componente/página funcional y responsive.
- Estados loading/empty/error contemplados.
- Integración con API o estado local según diseño.
Done:
- UX usable en móvil y desktop.
- Estructura lista para handoff a @styling.
```

### Styling Tailwind

```md
@styling
Objetivo: aplicar sistema visual a <pantalla/componente>.
Skill obligatoria: .cursor/skills/styling/apply_tailwind.md
Complementaria (si aplica): .cursor/skills/styling/create_ui_pattern.md
Salida esperada:
- Estilos consistentes con patrón reusable.
- Contraste y estados interactivos correctos.
Done:
- Responsive validado en breakpoints principales.
- Sin romper layout existente.
```

### Base de datos

```md
@db-dev
Objetivo: preparar persistencia para <feature>.
Skill obligatoria: .cursor/skills/database/create_schema.md
Complementarias: create_migration.md / create_seed.md
Salida esperada:
- Esquema y migración aplicables.
- Seed mínima para pruebas.
Done:
- Migración reversible o segura.
- Compatibilidad con backend actual.
```

### Revisión y seguridad

```md
@security-auditor
Objetivo: auditar cambios de código antes de reviewer.
Skill obligatoria: .cursor/skills/review/security_check.md
Salida esperada:
- Hallazgos priorizados (severidad + evidencia).
- Recomendación de remediación accionable.
Done:
- No quedan riesgos críticos sin plan de mitigación.
```

```md
@reviewer
Objetivo: validar calidad final del cambio.
Skill obligatoria: .cursor/skills/review/code_review.md
Salida esperada:
- Lista de issues por severidad.
- Veredicto final (aprobado / cambios requeridos).
Done:
- Cobertura de pruebas y riesgos documentada.
```

## Reglas de oro para potenciar skills

1. Declara siempre **una skill obligatoria** por tarea.
2. Limita cada delegación a **un resultado concreto** (no tareas mezcladas).
3. Exige **salida verificable** (tests, lint, auditoría o evidencia de ejecución).
4. Si hay dudas de dominio, devuelve a `@orchestrator` en vez de improvisar.
5. En cambios no triviales, respeta pipeline de `AGENTS.md` (planner → orchestrator → especialistas → seguridad → reviewer).
