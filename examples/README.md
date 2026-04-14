# Ejemplos y proyectos consumidores

Esta plantilla **no** incluye una app Next completa embebida (evita duplicar mantenimiento y versiones de framework). El flujo típico es:

1. Crea o clona tu repositorio de aplicación (por ejemplo Next + Tailwind).
2. Desde la raíz de **my-team**, ejecuta:

   ```bash
   npm run setup:cursor -- /ruta/absoluta/a/tu-app
   ```

   Con documentación de plantilla en la raíz de la app (`README.md`, `AGENTS.md`, `CHANGELOG.md`):

   ```bash
   npm run setup:cursor -- /ruta/absoluta/a/tu-app --with-docs
   ```

3. Abre **tu-app** en Cursor: tendrás `.cursor/`, `ai-team/` y reglas alineadas con `STACK.md` (perfil `next-tailwind` u otro).

Para el mismo texto de agentes y checklist en el repo de la app, usa **`--with-docs`** en el comando anterior; si no, puedes copiar esos archivos a mano desde **my-team**.
