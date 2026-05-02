## Estructura de archivos a crear:

  1. **`plugins/driver.client.ts`** — Plugin client-only que SOLO importa el CSS:
     `import 'driver.js/dist/driver.css'`
     No crear instancia aquí.

  2. **`composables/useDriverTour.ts`** — Composable que exporta `startTour(steps, overrides?)`.
     Cada llamada crea una nueva instancia de `driver()` con esta config base:
     - showProgress: true, animate: true
     - overlayColor: 'rgba(0,0,0,0.5)', stagePadding: 8, stageRadius: 8
     - Textos en español: nextBtnText "Siguiente →", prevBtnText "← Anterior",
       doneBtnText "Finalizar", progressText "{{current}} de {{total}}"
     - popoverClass: 'mi-app-driver-popover' (para estilos custom)
     - onDestroyStarted: llama a driverInstance.destroy()
     - Permite merge de overrides y recibe steps como último parámetro

  3. **`constants/tours.ts`** — Objeto `TOURS: Record<string, DriveStep[]>` con todos los tours.
     Convención: los selectores usan atributos `data-tour="<id>"` en el DOM.
     Cada step tiene: element (selector data-tour), popover con title, description, side y align.
     Los pasos sin `element` aparecen centrados (útil para intros).

  4. **Estilos globales** en `app.vue` dentro de `<style>` (no scoped) para personalizar
     `.mi-app-driver-popover` y sus hijos:
     - .driver-popover-title
     - .driver-popover-description
     - .driver-popover-progress-text
     - .driver-popover-navigation-btns button
     - .driver-popover-next-btn (botón primario)
     - .driver-popover-close-btn

  5. **Uso en páginas**: importar useDriverTour + TOURS, agregar un botón que llame
     `startTour(TOURS.miTour)`. Marcar elementos del DOM con `data-tour="mi-id"`.

  ## Requisitos:
  - Instalar: `npm install driver.js`
  - Cada tour es independiente (nueva instancia por llamada)
  - Los tours se pueden mostrar condicionalmente con v-if
  - Los pasos que apuntan a elementos no existentes en el DOM se muestran centrados automáticamente

  Mis tours serán para las siguientes páginas: [LISTA TUS PÁGINAS Y SECCIONES AQUÍ]
  Mi paleta de colores es: [DESCRIBE TU PALETA AQUÍ]

  Reemplaza los placeholders [...] con tu información específica y Claude generará toda la implementación adaptada a tu proyecto.
