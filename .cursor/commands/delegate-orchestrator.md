# /delegate-orchestrator

Delegacion rapida para coordinacion del trabajo con skills y handoffs claros.

## Description

Genera un prompt para `@orchestrator` con matriz de delegacion y proximo mensaje, respetando el pipeline del repo.

## Usage

/delegate-orchestrator [objetivo]

Opcional:
- `Perfil activo: next-tailwind|design-ux|content-marketing`
- `Riesgo: bajo|medio|alto`

## Prompt listo para pegar

```md
@orchestrator
Objetivo: coordinar la implementacion de <feature/bug>.
Contexto: <alcance, restricciones, dependencias>.
Skill obligatoria: .cursor/skills/planning/delegate_task.md
Requisitos de salida:
- RESUMEN
- MATRIZ DE DELEGACION (agente -> tarea -> skill -> entregable)
- ESTADO DEL PIPELINE
- PROXIMO MENSAJE listo para ejecutar
- RIESGOS / BLOQUEADORES
Reglas:
- No implementar codigo de app en esta fase.
- Respetar pipeline de AGENTS.md.
- Si hay codigo generado, incluir paso @security-auditor.
- Si hay API/DB/auth/input usuario, incluir paso @security-sentinel.
Criterio de done:
- Plan delegable sin ambiguedades.
- Orden de ejecucion y handoffs definidos.
```
