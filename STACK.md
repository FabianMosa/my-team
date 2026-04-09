# Perfiles de proyecto (stack)

Usa **un perfil activo** por feature o por repo. El `@planner` y el `@orchestrator` deben leerlo y ajustar tareas (sin mezclar stacks).

## Perfil A — `next-tailwind` (por defecto en esta plantilla)

- **Stack:** Next.js, JavaScript, Tailwind CSS
- **Agentes típicos:** `@planner` → `@orchestrator` → `@frontend` / `@styling` / `@backend` / `@db-dev` → `@integration` → `@security-sentinel` (si aplica) → `@reviewer`
- **Cuándo:** aplicaciones web con esta plantilla

## Perfil B — `design-ux` (producto / diseño de experiencia)

- **Enfoque:** flujos, jerarquía, estados vacíos/error, accesibilidad, microcopy de UI
- **Agentes típicos:** `@ux` antes o en paralelo con `@frontend`; `@content` para textos finales
- **Cuándo:** proyectos donde el riesgo principal es **claridad y usabilidad**, no solo código

## Perfil C — `content-marketing` (go-to-market y copy)

- **Enfoque:** estrategia de mensaje, posicionamiento, estructura de activos de marketing, SEO on-page (sin prometer rankings)
- **Agentes típicos:** `@marketing` → `@content` → `@reviewer` (calidad editorial); código mínimo o ninguno
- **Cuándo:** landings, decks de copy, emails, campañas y páginas de conversión (como documentos en repo)

## Cómo activar un perfil

En el primer mensaje del feature, indica explícitamente:

```text
Perfil activo: next-tailwind
```

o

```text
Perfil activo: design-ux
```

El `@planner` debe reflejar el perfil en **PLAN → Architecture** (una línea).

## Cómo pedir trabajo a un agente (estilo del equipo)

Usa pedidos con estructura fija, criterios verificables y rutas explícitas.

### Formato mínimo (copiar/pegar)

```text
Agente: @nombre-agente
Perfil activo: next-tailwind | design-ux | content-marketing
Objetivo: resultado concreto en 1 frase
Contexto: archivos/rutas + restricciones + estado actual
Entregable: salida esperada (plan, código, copy, checklist)
Criterios de aceptación: 3-5 checks medibles
Handoff: quién sigue después (@orchestrator, @reviewer, etc.)
```

### Reglas rápidas de redacción

- Escribe con verbo de acción: "implementa", "refactoriza", "valida", "documenta".
- Evita ambiguedad: cambia "mejorar" por criterios exactos y testeables.
- Incluye alcance: qué sí tocar y qué no tocar.
- Pide salida en formato del rol (si el rol tiene "Mandatory output format", respétalo).
- Define prioridad cuando aplique: seguridad > integración > estilo.

### Plantillas por tipo de pedido

```text
Agente: @planner
Perfil activo: next-tailwind
Objetivo: descomponer el feature en tareas ejecutables.
Contexto: ya existe auth base en app/auth.
Entregable: plan por fases con dependencias y riesgos.
Criterios de aceptación: tareas de 1 objetivo, orden claro, sin mezclar capas en una misma tarea.
Handoff: @orchestrator
```

```text
Agente: @frontend
Perfil activo: next-tailwind
Objetivo: implementar formulario de registro responsive.
Contexto: usar Tailwind y componentes existentes; no cambiar lógica de backend.
Entregable: cambios en app/register/page.js + estado de carga/error.
Criterios de aceptación: mobile/desktop ok, validación visible, sin romper layout actual.
Handoff: @integration
```

```text
Agente: @marketing
Perfil activo: content-marketing
Objetivo: definir mensaje principal y CTA de landing.
Contexto: audiencia pymes LATAM, producto en etapa de validación.
Entregable: propuesta en ai-team/marketing.md con titular + subtitulo + CTA + 3 mensajes de soporte.
Criterios de aceptación: mensaje claro en primera pantalla, claim auditable, CTA accionable.
Handoff: @content
```
