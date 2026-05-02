 Remodelacion Wedding Page - Light Mode Elegante con Cyan, Floral y Agave                                                                                                 │
     │                                                                                                                                                                          │
     │ Contexto                                                                                                                                                                 │
     │                                                                                                                                                                          │
     │ La pagina de bodas actual (Joselyn & Paul) usa un tema dark mode con paleta sage/cream/gold. El objetivo es transformarla en un diseno light mode elegante y fresco con  │
     │ colores cyan, detalles florales sutiles y referencias agaveras/rancheras — acorde a la boda en Etzatlan, Jalisco (region tequilera).                                     │
     │                                                                                                                                                                          │
     │ Proyecto: Nuxt 3 + Vue 3 + Tailwind CSS en /Users/admin/Documents/Github/bodaProject2                                                                                    │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Fase 1 — Fundacion (Paleta y Modo Light)                                                                                                                                 │
     │                                                                                                                                                                          │
     │ 1.1 Nueva paleta de colores                                                                                                                                              │
     │                                                                                                                                                                          │
     │ Archivo: tailwind.config.js                                                                                                                                              │
     │                                                                                                                                                                          │
     │ Reemplazar colors.brand con:                                                                                                                                             │
     │ brand: {                                                                                                                                                                 │
     │   cyan:         '#0E7490',   // Acento principal (headings, botones, links)                                                                                              │
     │   'cyan-light': '#A5F3FC',   // Highlights suaves, estados seleccionados                                                                                                 │
     │   sky:          '#E0F7FA',   // Fondos de seccion, cards                                                                                                                 │
     │   cream:        '#FDFCF8',   // Fondo general (blanco calido)                                                                                                            │
     │   agave:        '#2D6A5A',   // Acento secundario verde (referencias agaveras)                                                                                           │
     │   copper:       '#B87333',   // Acento calido (iconos, bordes, detalles metalicos)                                                                                       │
     │   charcoal:     '#1E293B',   // Texto principal                                                                                                                          │
     │   sand:         '#F5F0E1',   // Neutro suave (dividers, fondos sutiles)                                                                                                  │
     │ }                                                                                                                                                                        │
     │                                                                                                                                                                          │
     │ Mapeo de tokens viejos a nuevos:                                                                                                                                         │
     │                                                                                                                                                                          │
     │ ┌─────────────┬────────────────┬────────────────────┐                                                                                                                    │
     │ │    Viejo    │     Nuevo      │        Uso         │                                                                                                                    │
     │ ├─────────────┼────────────────┼────────────────────┤                                                                                                                    │
     │ │ brand-sage  │ brand-cyan     │ Acento principal   │                                                                                                                    │
     │ ├─────────────┼────────────────┼────────────────────┤                                                                                                                    │
     │ │ brand-gold  │ brand-copper   │ Acento calido      │                                                                                                                    │
     │ ├─────────────┼────────────────┼────────────────────┤                                                                                                                    │
     │ │ brand-cream │ brand-cream    │ Fondo (hex cambia) │                                                                                                                    │
     │ ├─────────────┼────────────────┼────────────────────┤                                                                                                                    │
     │ │ brand-dark  │ brand-charcoal │ Texto              │                                                                                                                    │
     │ ├─────────────┼────────────────┼────────────────────┤                                                                                                                    │
     │ │ brand-blush │ brand-sand     │ Neutro             │                                                                                                                    │
     │ ├─────────────┼────────────────┼────────────────────┤                                                                                                                    │
     │ │ brand-rose  │ brand-agave    │ Acento secundario  │                                                                                                                    │
     │ └─────────────┴────────────────┴────────────────────┘                                                                                                                    │
     │                                                                                                                                                                          │
     │ 1.2 Cambiar a Light Mode                                                                                                                                                 │
     │                                                                                                                                                                          │
     │ Archivo: app.vue (linea 19)                                                                                                                                              │
     │ - Cambiar colorMode.value = 'dark' → colorMode.value = 'light'                                                                                                           │
     │ - Actualizar clase root: bg-brand-cream (quitar dark:bg-brand-dark)                                                                                                      │
     │ - Actualizar estilos del tour Driver.js:                                                                                                                                 │
     │   - Background: #FDFCF8, texto: #1E293B, border: #0E7490                                                                                                                 │
     │   - Titulo: #0E7490, botones: bg #0E7490                                                                                                                                 │
     │                                                                                                                                                                          │
     │ Archivo: nuxt.config.ts                                                                                                                                                  │
     │ - Asegurar preference: 'light' en colorMode                                                                                                                              │
     │                                                                                                                                                                          │
     │ 1.3 Fix critico del carousel                                                                                                                                             │
     │                                                                                                                                                                          │
     │ Archivo: components/carouselComponent.vue (~linea 58)                                                                                                                    │
     │ - ELIMINAR :root { background-color: #242424 } — este override global rompe el light mode                                                                                │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Fase 2 — Reemplazo Global de Tokens                                                                                                                                      │
     │                                                                                                                                                                          │
     │ Buscar y reemplazar en todos los componentes, layouts y pages:                                                                                                           │
     │                                                                                                                                                                          │
     │ 1. brand-sage → brand-cyan                                                                                                                                               │
     │ 2. brand-gold → brand-copper                                                                                                                                             │
     │ 3. brand-rose → brand-agave                                                                                                                                              │
     │ 4. brand-dark → brand-charcoal                                                                                                                                           │
     │ 5. brand-blush → brand-sand                                                                                                                                              │
     │ 6. Eliminar todas las clases con prefijo dark: (ya no se necesitan)                                                                                                      │
     │                                                                                                                                                                          │
     │ Archivos afectados (~20+ archivos):                                                                                                                                      │
     │ - components/*.vue (todos)                                                                                                                                               │
     │ - layouts/default.vue                                                                                                                                                    │
     │ - pages/index.vue, confirm.vue, banco.vue, admin.vue                                                                                                                     │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Fase 3 — Ajustes por Componente                                                                                                                                          │
     │                                                                                                                                                                          │
     │ Colores hardcodeados que deben usar tokens de marca:                                                                                                                     │
     │                                                                                                                                                                          │
     │ ┌───────────────────────┬───────────────────────────────────────────────┬─────────────────────────────────────────────────────────┐                                      │
     │ │      Componente       │                 Color actual                  │                          Nuevo                          │                                      │
     │ ├───────────────────────┼───────────────────────────────────────────────┼─────────────────────────────────────────────────────────┤                                      │
     │ │ headerComponent.vue   │ bg-cyan-800, bg-violet-500                    │ bg-brand-cyan                                           │                                      │
     │ ├───────────────────────┼───────────────────────────────────────────────┼─────────────────────────────────────────────────────────┤                                      │
     │ │ confirmComponent.vue  │ bg-orange-500, focus:outline-indigo-600       │ bg-brand-cyan, focus:outline-brand-cyan                 │                                      │
     │ ├───────────────────────┼───────────────────────────────────────────────┼─────────────────────────────────────────────────────────┤                                      │
     │ │ googleMap.vue         │ bg-orange-300, bg-indigo-600, text-brand-gold │ bg-brand-cyan, bg-brand-agave, text-brand-copper        │                                      │
     │ ├───────────────────────┼───────────────────────────────────────────────┼─────────────────────────────────────────────────────────┤                                      │
     │ │ calendarComponent.vue │ bg-orange-200, bg-indigo-600, text-gray-200   │ bg-brand-cyan-light, bg-brand-cyan, text-brand-charcoal │                                      │
     │ ├───────────────────────┼───────────────────────────────────────────────┼─────────────────────────────────────────────────────────┤                                      │
     │ │ banco.vue             │ bg-violet-500                                 │ bg-brand-cyan                                           │                                      │
     │ ├───────────────────────┼───────────────────────────────────────────────┼─────────────────────────────────────────────────────────┤                                      │
     │ │ mesaRegalos.vue       │ bg-cyan-800                                   │ bg-brand-cyan                                           │                                      │
     │ └───────────────────────┴───────────────────────────────────────────────┴─────────────────────────────────────────────────────────┘                                      │
     │                                                                                                                                                                          │
     │ Componentes con ajustes especificos:                                                                                                                                     │
     │                                                                                                                                                                          │
     │ - heroComponent.vue: Aclarar overlay gradient (from-black/30, to-black/10)                                                                                               │
     │ - countDown.vue (mobile): Container bg-brand-sky, numeros text-brand-cyan                                                                                                │
     │ - timeLine.vue: Linea vertical bg-brand-cyan/30, circulos border-brand-cyan, fondo bg-white                                                                              │
     │ - layouts/default.vue: Boton back-to-top bg-brand-cyan/90, footer border-brand-sand                                                                                      │
     │ - datosBancarios.vue: Labels text-brand-cyan, quitar todos los dark: overrides                                                                                           │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Fase 4 — Detalles Florales y Agaveros                                                                                                                                    │
     │                                                                                                                                                                          │
     │ 4.1 Decoraciones florales                                                                                                                                                │
     │                                                                                                                                                                          │
     │ - Dividers entre secciones: Crear clase CSS .floral-divider con pseudo-elementos ::before/::after usando un SVG de ornamento floral horizontal. Aplicar entre secciones  │
     │ principales en pages/index.vue.                                                                                                                                          │
     │ - Esquinas de cards: Crear componente FloralCorner.vue con SVG inline de ornamento floral-agave en colores brand. Colocar en ourParents.vue, saveDateComponent.vue,      │
     │ confirmComponent.vue.                                                                                                                                                    │
     │ - Imagenes decorativas existentes (flowerCorner.webp, diseno-floral-*.webp): Necesitan actualizarse a tonos cyan/copper para el tema light — marcar para reemplazo de    │
     │ assets.                                                                                                                                                                  │
     │                                                                                                                                                                          │
     │ 4.2 Elementos agaveros/rancheros (sutiles, 3-4 ubicaciones)                                                                                                              │
     │                                                                                                                                                                          │
     │ 1. petaloComponent.vue: Mezclar hojas de agave con petalos en la animacion de caida                                                                                      │
     │ 2. Dividers de seccion: El SVG floral-divider.svg incluira siluetas de agave estilizadas entre flores                                                                    │
     │ 3. Timeline: Reemplazar imagen decorativa timeLine.webp con ilustracion acuarela de campos de agave                                                                      │
     │ 4. Footer: Agregar pequena silueta SVG de agave junto al copyright                                                                                                       │
     │ 5. Icono t.webp (usado en ourParents y saveDate): Reemplazar con roseta de agave en color copper                                                                         │
     │                                                                                                                                                                          │
     │ 4.3 Assets nuevos necesarios                                                                                                                                             │
     │                                                                                                                                                                          │
     │ ┌────────────────────────────────────────────────────────────┬──────┬───────────────────────────────────┐                                                                │
     │ │                           Asset                            │ Tipo │             Proposito             │                                                                │
     │ ├────────────────────────────────────────────────────────────┼──────┼───────────────────────────────────┤                                                                │
     │ │ floral-divider.svg                                         │ SVG  │ Divider horizontal floral-agave   │                                                                │
     │ ├────────────────────────────────────────────────────────────┼──────┼───────────────────────────────────┤                                                                │
     │ │ agave-corner.svg                                           │ SVG  │ Ornamento esquina para cards      │                                                                │
     │ ├────────────────────────────────────────────────────────────┼──────┼───────────────────────────────────┤                                                                │
     │ │ agave-rosette.svg                                          │ SVG  │ Icono pequeno reemplazando t.webp │                                                                │
     │ ├────────────────────────────────────────────────────────────┼──────┼───────────────────────────────────┤                                                                │
     │ │ Versiones cyan de flowerCorner.webp y diseno-floral-*.webp │ WebP │ Decoraciones actualizadas al tema │                                                                │
     │ └────────────────────────────────────────────────────────────┴──────┴───────────────────────────────────┘                                                                │
     │                                                                                                                                                                          │
     │ ▎ Nota: Los SVGs se crearan como componentes Vue inline o como archivos en /public/. Las imagenes WebP requieren edicion grafica externa o generacion con IA.            │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Fase 5 — Tour y Polish                                                                                                                                                   │
     │                                                                                                                                                                          │
     │ - Actualizar estilos Driver.js en app.vue (colores del popover)                                                                                                          │
     │ - Verificar que logo.webp sea visible sobre fondo claro (si no, crear variante)                                                                                          │
     │ - Revisar responsive en mobile (xs/sm breakpoints)                                                                                                                       │
     │ - Probar todas las paginas: /, /confirm, /banco, /admin                                                                                                                  │
     │ - Verificar navegacion del carousel, Google Maps markers, botones WhatsApp                                                                                               │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Verificacion                                                                                                                                                             │
     │                                                                                                                                                                          │
     │ 1. npm run dev — levantar servidor de desarrollo                                                                                                                         │
     │ 2. Navegar a http://localhost:3000 — verificar que el fondo es claro (cream)                                                                                             │
     │ 3. Recorrer todas las secciones: Hero → Parents → Promise → Carousel → SaveDate → Map → Timeline → Contact → DressCode → Gifts → Confirmation                            │
     │ 4. Verificar que no queden textos invisibles (texto claro sobre fondo claro)                                                                                             │
     │ 5. Probar en mobile (375px) y desktop                                                                                                                                    │
     │ 6. Navegar a /confirm, /banco, /admin y verificar colores                                                                                                                │
     │ 7. Verificar animacion de petalos                                                                                                                                        │
     │ 8. Verificar tour guide (Driver.js)                                                                                                                                      │
     │                                                                                                                                                                          │
     │ ---                                                                                                                                                                      │
     │ Archivos Criticos                                                                                                                                                        │
     │                                                                                                                                                                          │
     │ tailwind.config.js          — Paleta de colores                                                                                                                          │
     │ app.vue                     — Modo light + tour styles                                                                                                                   │
     │ nuxt.config.ts              — Color mode config                                                                                                                          │
     │ layouts/default.vue         — Layout global                                                                                                                              │
     │ pages/index.vue             — Pagina principal                                                                                                                           │
     │ components/carouselComponent.vue  — Fix :root background                                                                                                                 │
     │ components/calendarComponent.vue  — Fix colores hardcodeados                                                                                                             │
     │ components/timeLine.vue     — Muchos dark: overrides                                                                                                                     │
     │ components/heroComponent.vue      — Overlay gradient                                                                                                                     │
     │ components/headerComponent.vue    — Nav colors                                                                                                                           │
     │ wedding.config.ts           — Config de contenido (sin cambios de color)                                                                                                 │
     ╰───────────────────────────────────────────────────────────────────────────