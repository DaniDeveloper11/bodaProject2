# Plan: Config Centralizado para Clonar Proyecto de Boda
## Objetivo
Refactorizar el proyecto de invitación de boda para que todo el contenido personalizable (nombres, fechas, textos, imágenes, colores, links, datos de contacto, etc.) esté centralizado en un único archivo `wedding.config.ts`. Esto permite clonar el proyecto cambiando solo ese archivo y las imágenes de `public/` para una boda diferente.
---
## Paso 1: Crear `wedding.config.ts` en la raíz del proyecto
```ts
export default {
  // === IDENTIDAD DE LA PAREJA ===
  couple: {
    name1: 'Daniela',
    name2: 'Daniel',
    fullName1: 'Daniela Elizabeth Orozco Gonzalez',
    fullName2: 'Daniel',
    initials: 'D&D',
    logo: '/logoDDr.webp',
    namesFont: "'Alex Brush', cursive",
    parentNames1: {
      father: 'Enrique Orozco Hernandez',
      mother: 'Elizabet González Gutierrez',
    },
    parentNames2: {
      father: 'Héctor Rene Montes Orendain',
      mother: 'Antonia Villarreal Rangel',
    },
  },
  // === FECHAS ===
  date: {
    weddingDate: '2026-10-04T13:00:00',
    displayDate: '04/10/2026',
    calendarMonthYear: 'Octubre 2026',
    rsvpDeadline: '31 de Agosto del 2025',
    calendarSelectedDate: '2026-10-04',
  },
  // === UBICACIÓN ===
  location: {
    city: 'Etzatlan Jalisco',
    church: {
      name: 'Templo',
      fullName: 'Templo de la Purísima Concepción',
      position: { lat: 20.76439604962931, lng: -104.08049966545539 },
      mapsUrl: 'https://www.google.com/maps/place/Parroquia+de+la+Purísima+Concepción/@20.7643749,-104.0830798,17z/data=!3m1!4b1!4m6!3m5!1s0x84247b3ef7dbbb17:0x1e83e8e7e0f8e6f8!8m2!3d20.76437!4d-104.0805!16s%2Fg%2F11c5b0q5m6?entry=ttu',
      icon: '/iglesiaBlanco.webp',
    },
    reception: {
      name: 'Recepción',
      fullName: 'El Ranchito, Escobedo #7',
      position: { lat: 20.76774609400717, lng: -104.09720436461963 },
      mapsUrl: 'https://maps.app.goo.gl/6pbkHd4kgUk2wsPu8',
      icon: '/papel-picado.webp',
    },
    mapCenter: 'church',
    mapZoom: 13,
  },
  // === CONTACTO ===
  contact: {
    groom: {
      label: 'Contacta al Novio',
      phone: '+52 3314857062',
      phoneRaw: '5213314857062',
      whatsappMessage: 'Hola Daniel y Daniela, quería contactarlos por su boda!',
    },
    bride: {
      label: 'Contacta a la Novia',
      phone: '+52 3334001701',
      phoneRaw: '5213334001701',
      whatsappMessage: 'Hola Daniel y Daniela, quería contactarlos por su boda!',
    },
  },
  // === DATOS BANCARIOS ===
  bank: {
    name: 'BBVA',
    holder: 'Daniela Elizabeth Orozco Gonzalez',
    accountNumber: '2760430463',
    concept: 'Regalo de bodas',
  },
  // === MESA DE REGALOS ===
  gifts: {
    liverpoolUrl: 'https://mesaderegalos.liverpool.com.mx/milistaderegalos/51992607',
    liverpoolUrlAlt: 'https://mesaderegalos.liverpool.com.mx/milistaderegalos/51605729',
  },
  // === IMÁGENES ===
  images: {
    hero: '/fotoHero.webp',
    promise: '/foto2.webp',
    timelineBottom: '/foto3.webp',
    flowerCorner: '/flowerCorner.webp',
    decorativeT: '/t.webp',
    disenoFloral1: '/diseno-floral.webp',
    disenoFloral2: '/diseno-floral-2.webp',
    disenoFloral3: '/diseno-floral-3.webp',
    petalo: '/petalo1.webp',
    novia: '/novia.webp',
    novio: '/novio.webp',
    dressCodeImg: '/dressCodeImg.webp',
    church: '/iglesia.webp',
    churchWhite: '/iglesiaBlanco.webp',
    papelPicado: '/papel-picado.webp',
    carousel: [
      '/us1.webp', '/us2.webp', '/us3.webp', '/us4.webp',
      '/us5.webp', '/us6.webp', '/us8.webp', '/us9.webp',
      '/us10.webp', '/us11.webp', '/us12.webp', '/us13.webp',
    ],
    timeline: {
      gettingReady: '/traje-de-boda.webp',
      ceremony: '/iglesia.webp',
      reception: '/animar.webp',
      banquet: '/banquete.webp',
      firstDance: '/baile.webp',
      party: '/pista-de-baile.webp',
      end: '/coche.webp',
    },
    dressCodeWomen: [
      '/vestidos1.webp', '/vestidos2.webp', '/vestidos3.webp', '/vestidos4.webp',
    ],
    dressCodeMen: [
      '/suits1.webp', '/suits2.webp', '/suits3.webp',
    ],
  },
  // === TEXTOS ===
  texts: {
    parentsIntro: 'Con nuestro amor y con la presencia de Dios entre nosotros y la bendición de nuestros padres:',
    countdown: {
      celebration: '🎉 ¡Es el gran día! ¡Felicidades! 💍',
      remaining: 'Faltan:',
      days: 'días',
      hours: 'horas',
      minutes: 'min',
      seconds: 'seg',
    },
    saveDate: 'Save The Date',
    promise: {
      title: 'UNA PROMESA PARA TODA LA VIDA',
      text: 'Nos conocimos en el 2015 y desde ese momento sentimos esa conexión. Sin embargo, no fue hasta finales del 2018 donde volvimos a reconectar y el resto es historia. Desde ese momento supimos que éramos el uno para el otro. Cada risa compartida, cada abrazo y cada sueño construido nos llevó hasta aquí. Ahora, con el corazón lleno de amor y emoción, damos el siguiente paso: unir nuestras vidas para siempre.',
    },
    timeline: {
      title: 'Wedding Time Line',
      events: [
        { time: '12:00 PM', title: 'Getting Ready', description: '', icon: 'gettingReady' },
        { time: '1:00 PM', title: 'Misa Religiosa', description: 'Ceremonia religiosa', icon: 'ceremony' },
        { time: '3:00 PM', title: 'Inicio de la recepción', description: 'Bienvenida y cóctel', icon: 'reception' },
        { time: '4:00 PM', title: 'Banquete', description: '', icon: 'banquet' },
        { time: '6:00 PM', title: 'Primer Vals', description: '', icon: 'firstDance' },
        { time: '7:00 PM', title: 'Inicio de la fiesta', description: '', icon: 'party' },
        { time: '1:00 AM', title: 'Fin de la recepción', description: '', icon: 'end' },
      ],
    },
    calendar: {
      dayNames: ['Don', 'Lue', 'Med', 'Jri', 'Vat', 'Sun'],
      selectedDayLabel: 'El Gran Día',
    },
    confirmation: {
      title: 'Confirme su asistencia',
      codeLabel: 'Codigo',
      codePlaceholder: 'ABXY2025',
      codeHelp: 'Codigo proporcionado en su invitacion.',
      button: 'Confirmar Asistencia',
      loading: 'Buscando...',
      notFound: 'Invitado no encontrado',
      error: 'Error al buscar el invitado',
    },
    confirmPage: {
      title: 'Confirma tu Asistencia',
      familyMessage: '✨ "Nos emociona compartir este momento tan especial con las personas que más queremos. Para ayudarnos a planear este día tan importante, por favor confirme su asistencia y la de su familia.',
      companionMessage: '✨ "Nos emociona compartir este momento tan especial con las personas que más queremos. Para ayudarnos a planear este día tan importante, por favor confirme su asistencia y la de sus acompañantes.',
      nameLabel: 'Nombre',
      confirmedLabel: 'confirmado',
      submitButton: 'Confirmar Asistencia',
      adultsOnly: 'Celebración exclusiva para ADULTOS.',
      adultsOnlyLink: 'https://www.tiktok.com/@gabylajarochita.83/video/7316280366153633030?is_from_webapp=1&lw_scan=1&shortcut_feature=feed',
      footer: 'Para más información, contacta a los novios.',
      footerThanks: '¡Gracias por ser parte de nuestro día especial!',
      backButton: 'Atrás',
      modalTitle: 'Confirmar Asistencia',
      modalMessage: '¿Estás seguro de que deseas confirmar?',
      successMessage: '¡Confirmación enviada con éxito!',
      errorMessage: 'Hubo un error al confirmar asistencia.',
    },
    dressCode: {
      title: 'Dress Code',
      intro: 'Queremos asegurarnos que todos se sientan cómodos y en sintonía con la celebración',
      level: 'Formal',
      womenLabel: 'Ellas',
      womenDescription: 'Vestidos florales, colores claros o tonos coloridos',
      womenRestriction: 'No Negro, Lila o Rojo',
      menLabel: 'Ellos',
      menDescription: 'Vestimenta elegante,',
      menRestriction: 'No Verde olivo',
      danceTitle: 'Preparate para Bailar',
      danceDescription: 'La fiesta no para, así que asegúrate de traer zapatos cómodos.',
      danceSuggestion: 'Sugerimos Tenis',
      womenCarouselTitle: 'Algunas ideas para ellas',
      menCarouselTitle: 'Algunas ideas para ellos',
    },
    contact: {
      title: 'Contacta a los novios',
    },
    gifts: {
      title: 'Regalos',
      intro: '¡Tu presencia es el mejor regalo! Pero si deseas contribuir, aquí tienes algunas opciones:',
      giftButton: 'Mesa de Regalos',
      bankButton: 'Datos Bancarios',
      footer: 'Para más información, contacta a los novios.',
      footerThanks: '¡Gracias por ser parte de nuestro día especial!',
    },
    bankPage: {
      title: 'Banco de Regalos',
      intro: 'Su presencia es lo más importante para nosotros, pero si desean hacernos un regalo, hemos creado un banco de regalos para facilitarlo. Aquí pueden encontrar los datos bancarios para hacer una transferencia.',
      giftButton: 'Mesa de Regalos Liverpool',
      footer: 'Para más información, contacta a los novios.',
      footerThanks: '¡Gracias por ser parte de nuestro día especial!',
      backButton: 'Atrás',
    },
    copy: 'Copiar',
    copied: '¡Número copiado!',
    nav: {
      giftRegistry: 'Mesa de Regalos',
      requestInfo: 'Solicitar Informacion',
      location: 'Ubicacion',
      dressCode: 'Codigo de Vestimenta',
      confirmAttendance: 'Confirma Asistencia',
    },
    footer: '© 2025 Realizado por el Novio.',
    modal: {
      title: '¿Estás seguro?',
      message: 'Esta acción no se puede deshacer.',
      confirm: 'Aceptar',
      cancel: 'Cancelar',
    },
  },
  
  // === PRISMA: Lados del invitado ===
  guestSides: {
    side1: 'NOVIO',
    side2: 'NOVIA',
    side1Label: 'Novio',
    side2Label: 'Novia',
  },
}
```
---
## Paso 2: Modificar `tailwind.config.js`
Los colores de la paleta brand siguen definidos directamente en `tailwind.config.js` (no se mueven al config para mantener simple la clonación — solo se edita tailwind.config si se quiere cambiar la paleta).
---
## Paso 3: Refactorizar cada componente
Todos los componentes deben importar:
```ts
import config from '~/wedding.config'
```
### 3.1 `components/namesComponent.vue`
- Línea 7: `"Daniela & Daniel"` → `` `${config.couple.name1} & ${config.couple.name2}` ``
- Línea 5: `font-family: 'Alex Brush'` → dinámico desde `config.couple.namesFont`
### 3.2 `components/ourParents.vue`
- Línea 15: `"Enrique Orozco Hernandez"` → `config.couple.parentNames1.father`
- Línea 16: `"Elizabet González Gutierrez"` → `config.couple.parentNames1.mother`
- Línea 29: `"Héctor Rene Montes Orendain"` → `config.couple.parentNames2.father`
- Línea 30: `"Antonia Villarreal Rangel"` → `config.couple.parentNames2.mother`
- Línea 6-8: Texto introductorio → `config.texts.parentsIntro`
- Línea 14,28: `text-[#6a8e58]` → `text-brand-sage`, `dark:text-[#8ab87a]` → `dark:text-brand-sage`
### 3.3 `components/heroComponent.vue`
- Línea 8: `src="fotoHero.webp"` → `:src="config.images.hero"`
### 3.4 `components/countDown.vue`
- Línea 32: `new Date('2026-10-04T13:00:00')` → `new Date(config.date.weddingDate)`
- Línea 4: Textos del countdown → `config.texts.countdown.*`
### 3.5 `components/saveDateComponent.vue`
- Línea 4,7: `src="t.webp"` → `:src="config.images.decorativeT"`
- Línea 5-6: `"Save The Date"` → `config.texts.saveDate`
### 3.6 `components/timeLine.vue`
- Línea 6: `src="flowerCorner.webp"` → `:src="config.images.flowerCorner"`
- Línea 73: `src="foto3.webp"` → `:src="config.images.timelineBottom"`
- Línea 14: `"Wedding Time Line"` → `config.texts.timeline.title`
- Líneas 99-191: Iterar `config.texts.timeline.events` y usar `config.images.timeline[icon]`
### 3.7 `components/calendarComponent.vue`
- Línea 4: `text-[#6a8e58]` → `text-brand-sage`
- Línea 8: `'Octubre 2025'` → `config.date.calendarMonthYear`
- Línea 15-34: Nombres de días → `config.texts.calendar.dayNames`
- Línea 49-50: `'El Gran Día'` → `config.texts.calendar.selectedDayLabel`
- Línea 132-134: Fecha seleccionada → `config.date.calendarSelectedDate`
- **NOTA IMPORTANTE:** Los datos del calendario (líneas 120-198) están hardcodeados. Deben generarse dinámicamente basándose en `config.date.weddingDate`. Crear una función util que genere el grid del mes.
### 3.8 `components/confirmComponent.vue`
- Reemplazar textos con `config.texts.confirmation.*`
- Imágenes: `flowerCorner.webp` → `config.images.flowerCorner`, `diseno-floral.webp` → `config.images.disenoFloral1`
### 3.9 `components/googleMap.vue`
- Línea 4: `"Etzatlan Jalisco"` → `config.location.city`
- Líneas 42-56: Datos de ubicación → `config.location.church` y `config.location.reception`
- Línea 45: `"iglesiaBlanco.webp"` → `config.location.church.icon`
- Línea 54: `"papel-picado.webp"` → `config.location.reception.icon`
- Línea 97-99: Center/zoom → `config.location.mapCenter` y `config.location.mapZoom`
### 3.10 `components/contactNovios.vue`
- Imágenes → `config.images.flowerCorner`, `config.images.disenoFloral2`
- Textos → `config.texts.contact.title`, `config.contact.groom/bride.*`
- WhatsApp links: `` `https://wa.me/${config.contact.groom.phoneRaw}?text=${encodeURIComponent(config.contact.groom.whatsappMessage)}` ``
### 3.11 `components/dressCode.vue`
- Textos → `config.texts.dressCode.*`
- Imágenes → `config.images.dressCodeImg`, iterar `config.images.dressCodeWomen/Men`
### 3.12 `components/mesaRegalos.vue`
- Imágenes → `config.images.flowerCorner`, `config.images.disenoFloral3`
- Textos → `config.texts.gifts.*`
- Liverpool URL → `config.gifts.liverpoolUrl`
### 3.13 `components/datosBancarios.vue`
- Datos → `config.bank.*`
- Textos → `config.texts.copy`, `config.texts.copied`
### 3.14 `components/promiseSection.vue`
- Imágenes → `config.images.promise`, `config.images.flowerCorner`
- Textos → `config.texts.promise.*`
### 3.15 `components/carouselComponent.vue`
- Array de imágenes → iterar `config.images.carousel`
### 3.16 `components/carouselDressCode.vue`
- Línea 151: `--vc-nav-color: #6a8e58` → `--vc-nav-color: theme(colors.brand.sage)` (o dejar hardcodeado)
### 3.17 `components/petaloComponent.vue`
- Línea 59: `background-image: url('/petalo.webp')` → estilo dinámico con `config.images.petalo`
### 3.18 `components/headerComponent.vue`
- Iniciales → `config.couple.initials`
- Logo → `:src="config.couple.logo"`
- Íconos novio/novia → `config.images.novia`, `config.images.novio`
- Liverpool URL → `config.gifts.liverpoolUrl`
- Nav textos → `config.texts.nav.*`
- WhatsApp links → construir dinámicamente con `config.contact.*`
### 3.19 `pages/confirm.vue`
- Textos → `config.texts.confirmPage.*`
- Imágenes → `config.images.flowerCorner`, `config.images.disenoFloral3`
- TikTok link → `config.texts.confirmPage.adultsOnlyLink`
### 3.20 `pages/banco.vue`
- Imágenes → `config.images.flowerCorner`
- Datos bancarios → `config.bank.*`
- Liverpool URL → `config.gifts.liverpoolUrlAlt`
- Textos → `config.texts.bankPage.*`
### 3.21 `app.vue`
- Sin cambios del config (los colores del tour se mantienen hardcodeados o se editan directamente)
### 3.22 `composables/useTour.ts`
- Sin cambios del config (steps/descripciones del tour se mantienen hardcodeados o se editan directamente)
### 3.23 `layouts/default.vue`
- Línea 23: Footer → `config.texts.footer`
---
## Paso 4: Corregir inconsistencia de fechas
**PROBLEMA:** Hay 3 fechas contradictorias:
- Countdown: `2026-10-04T13:00:00`
- Calendar selected: `2025-01-04` (año diferente!)
- Calendar display: `04/10/2025` (año diferente!)
- RSVP deadline: `31 de Agosto del 2025`
**ACCIÓN:** Unificar en `config.date.weddingDate` y derivar todo lo demás. El calendario debe generarse dinámicamente.
---
## Paso 5: Para una nueva boda
1. **Editar `wedding.config.ts`** — Nombres, fechas, textos, datos de contacto, links
2. **Editar `tailwind.config.js`** — Paleta de colores (manualmente)
3. **Reemplazar imágenes en `public/`** — Subir nuevas fotos
4. **Reemplazar íconos en `assets/icons/`** — Si cambian
5. **Editar `prisma/seed.ts`** — Invitados de la nueva boda
6. **Nueva BD en Railway** — Con su propia `DATABASE_URL`
7. **Actualizar `nuxt.config.ts`** — Si cambian las fuentes de Google
8. **Nuevo deploy en Railway** — Conectar el nuevo repo fork
---
## Notas importantes
- `components/calendarComponent.vue` tiene el grid del calendario hardcodeado (líneas 120-198). **Debe generarse dinámicamente** basándose en la fecha de boda.
- Los enum values de Prisma (`NOVIO`/`NOVIA`) no pueden ser dinámicos. Si se necesitan labels diferentes, requiere nueva migración.
- WhatsApp links deben construirse dinámicamente: `https://wa.me/${phoneRaw}?text=${encodeURIComponent(message)}`
