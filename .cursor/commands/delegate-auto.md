# /delegate-auto

Router de delegacion para elegir rapidamente el mejor comando o agente segun el objetivo.

## Description

Analiza la solicitud y devuelve el siguiente paso recomendado del pipeline con comando sugerido, agente target, skill obligatoria y prompt listo para ejecutar.

## Usage

/delegate-auto [objetivo]

Opcional al inicio:
- `Perfil activo: next-tailwind|design-ux|content-marketing`
- `Riesgo: bajo|medio|alto`
- `Prioridad: velocidad|equilibrio|max-seguridad`

## Salida esperada (formato fijo)

```md
RESUMEN
- <lectura breve del objetivo>

RECOMENDACION
- Comando: </delegate-orchestrator | /delegate-backend | /delegate-frontend | /delegate-styling | /delegate-db | /delegate-review | /delegate-with-skills>
- Agente: <@orchestrator | @backend | @frontend | @styling | @db-dev | @security-auditor | @reviewer>
- Skill obligatoria: <ruta de .cursor/skills/...>
- Razon: <por que esta via minimiza riesgo y friccion>

PROMPT LISTO PARA PEGAR
```md
<prompt final para ejecutar>
```

VERIFICACION
- Evidencia minima requerida: <tests/lint/audit/criterio de done>
- Proximo paso despues de completar: <siguiente comando recomendado>
```

## Reglas de decision rapida

1. Si el objetivo es ambiguo o toca multiples dominios, recomendar `/delegate-orchestrator`.
2. Si es endpoint o logica servidor aislada, recomendar `/delegate-backend`.
3. Si es pantalla, flujo o componente de UI, recomendar `/delegate-frontend`.
4. Si es consistencia visual o Tailwind, recomendar `/delegate-styling`.
5. Si cambia modelo de datos, migraciones o seeds, recomendar `/delegate-db`.
6. Si es auditoria o cierre de calidad, recomendar `/delegate-review`.
7. Si no encaja claro en una categoria, recomendar `/delegate-with-skills`.
8. Si hay API/DB/auth/input usuario, incluir recordatorio de `@security-sentinel` despues de `@security-auditor`.

## Ejemplo corto

```md
/delegate-auto Objetivo: agregar login con email y password
```

Debe responder priorizando:
- `/delegate-orchestrator` para partir.
- Secuencia sugerida: backend -> frontend -> styling -> review.
