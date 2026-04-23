# /delegate-backend

Delegación rápida para tareas de backend con skill obligatoria.

## Description

Genera un handoff directo para `@backend`, priorizando contratos claros, validación y pruebas.

## Usage

/delegate-backend [objetivo]

Opcional:
- `Riesgo: bajo|medio|alto`
- `Perfil activo: next-tailwind` (u otro de `STACK.md`)

## Prompt listo para pegar

```md
@backend
Objetivo: <endpoint o lógica de servidor a implementar>.
Contexto: <feature/bug + restricciones>.
Skill obligatoria: .cursor/skills/backend/create_api_route.md
Skill complementaria (si aplica): .cursor/skills/backend/add_validation.md
Entradas:
- <rutas o archivos actuales>
- <reglas de negocio o contrato>
Salida esperada:
- Endpoint o lógica implementada.
- Validaciones de entrada/salida.
- Manejo de errores consistente.
- Tests mínimos del caso feliz y fallo principal.
Criterio de done:
- Contrato request/response verificable.
- Sin romper tests existentes relacionados.
- Handoff a @orchestrator si la tarea sale de backend.
```
