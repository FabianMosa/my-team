# /delegate-styling

Delegación rápida para tareas de styling con skill obligatoria.

## Description

Genera un handoff directo para `@styling`, orientado a consistencia visual y patrones reutilizables con Tailwind.

## Usage

/delegate-styling [objetivo]

Opcional:
- `Riesgo: bajo|medio|alto`
- `Perfil activo: next-tailwind` (u otro de `STACK.md`)

## Prompt listo para pegar

```md
@styling
Objetivo: <refinar estilo de pantalla/componente>.
Contexto: <feature/bug + restricciones de diseño>.
Skill obligatoria: .cursor/skills/styling/apply_tailwind.md
Skill complementaria (si aplica): .cursor/skills/styling/create_ui_pattern.md
Entradas:
- <componentes a estilizar>
- <tokens, guideline visual o referencia>
Salida esperada:
- Estilos consistentes y reutilizables.
- Estados hover/focus/disabled definidos.
- Responsive mantenido sin romper layout.
Criterio de done:
- Contraste y jerarquía visual correctos.
- Breakpoints principales validados.
- Handoff a @orchestrator si detecta impacto cross-domain.
```
