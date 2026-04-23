# /delegate-review

Delegación rápida para revisión de seguridad/calidad con skill obligatoria.

## Description

Genera handoff para `@security-auditor` o `@reviewer`, con formato de hallazgos y veredicto accionable.

## Usage

/delegate-review [objetivo]

Opcional:
- `Modo: security|quality|full`
- `Riesgo: bajo|medio|alto`

## Prompt listo para pegar (security)

```md
@security-auditor
Objetivo: auditar cambios antes de revisión final.
Contexto: <PR/feature + superficie sensible>.
Skill obligatoria: .cursor/skills/review/security_check.md
Entradas:
- <archivos/capas impactadas>
- <amenazas o riesgos esperados>
Salida esperada:
- Hallazgos por severidad con evidencia.
- Recomendaciones de remediación accionables.
Criterio de done:
- Sin críticos abiertos sin plan.
- Handoff a @orchestrator con pendientes claros.
```

## Prompt listo para pegar (quality)

```md
@reviewer
Objetivo: revisar calidad final del cambio.
Contexto: <PR/feature + criterios de aceptación>.
Skill obligatoria: .cursor/skills/review/code_review.md
Entradas:
- <diff o archivos>
- <riesgos de regresión>
Salida esperada:
- Issues por severidad.
- Veredicto: aprobado o cambios requeridos.
Criterio de done:
- Cobertura de pruebas/riesgos documentada.
- Recomendaciones concretas para cierre.
```
