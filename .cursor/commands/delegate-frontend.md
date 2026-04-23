# /delegate-frontend

Delegación rápida para tareas de frontend con skill obligatoria.

## Description

Genera un handoff directo para `@frontend`, con foco en experiencia responsive y estados de UI completos.

## Usage

/delegate-frontend [objetivo]

Opcional:
- `Riesgo: bajo|medio|alto`
- `Perfil activo: next-tailwind` (u otro de `STACK.md`)

## Prompt listo para pegar

```md
@frontend
Objetivo: <pantalla/componente/flujo a construir>.
Contexto: <feature/bug + restricciones>.
Skill obligatoria: .cursor/skills/frontend/create_component.md
Skill complementaria (si aplica): .cursor/skills/frontend/create_next_page.md
Entradas:
- <componentes o páginas actuales>
- <contrato de API o estado>
Salida esperada:
- UI funcional en móvil y desktop.
- Estados loading/empty/error contemplados.
- Integración con datos (API/estado) según requerimiento.
Criterio de done:
- Comportamiento responsive validado.
- Acciones principales del usuario completan el flujo.
- Handoff a @styling o @orchestrator según corresponda.
```
