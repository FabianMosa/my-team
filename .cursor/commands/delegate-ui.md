# /delegate-ui

Delegación rápida para tareas de UI Engineer con skill obligatoria.

## Description

Genera un handoff directo para `@ui-engineer`, con foco en UX, diseño responsive y estados de UI completos.

## Usage

/delegate-ui [objetivo]

Opcional:
- `Riesgo: bajo|medio|alto`
- `Perfil activo: next-tailwind` (u otro de `STACK.md`)

## Prompt listo para pegar

```md
@ui-engineer
Objetivo: <pantalla/componente/flujo a construir>.
Contexto: <feature/bug + restricciones>.
Skill obligatoria: .cursor/skills/ui/create_component.md
Skill complementaria (si aplica): .cursor/skills/ui/create_next_page.md
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
- Handoff a @orchestrator según corresponda.
```
