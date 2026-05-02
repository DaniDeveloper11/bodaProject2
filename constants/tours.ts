import type { DriveStep } from 'driver.js'

export const TOURS: Record<string, DriveStep[]> = {
  home: [
    {
      popover: {
        title: '¡Bienvenidos!',
        description: 'Bienvenidos a nuestra invitación virtual. Aquí encontrarás toda la información de nuestra boda.',
      },
    },
    {
      element: '[data-tour="hero"]',
      popover: {
        title: 'Nuestra Portada',
        description: 'Bienvenidos a nuestra invitación virtual. Aquí encontrarás toda la información de nuestra boda.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="our-parents"]',
      popover: {
        title: 'Con la bendición',
        description: 'Con la bendición de nuestros padres comenzamos esta nueva etapa.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="promise"]',
      popover: {
        title: 'Nuestra historia',
        description: 'Una promesa para toda la vida. Aquí te contamos cómo comenzó todo.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="carousel"]',
      popover: {
        title: 'Nuestros momentos',
        description: 'Algunos de los momentos más especiales que hemos compartido juntos.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="save-date"]',
      popover: {
        title: 'Guarda la fecha',
        description: '¡Guarda la fecha! Falta poco para el gran día.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="ubicacion"]',
      popover: {
        title: 'Ubicación',
        description: 'Aquí será la misa y celebración. Podrás ver el mapa y las indicaciones.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="fecha"]',
      popover: {
        title: 'Itinerario',
        description: 'El itinerario del gran día para que no te pierdas ningún momento.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="informacion"]',
      popover: {
        title: 'Contáctanos',
        description: 'Si tienes alguna duda, aquí encontrarás la información de contacto de los novios.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="dressCode"]',
      popover: {
        title: 'Código de vestimenta',
        description: 'Checa el código de vestimenta para el evento.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="mesa-regalos"]',
      popover: {
        title: 'Mesa de regalos',
        description: 'Si deseas contribuir con un regalo, aquí encontrarás las opciones.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirmacion"]',
      popover: {
        title: 'Confirma tu asistencia',
        description: 'Ingresa el código que viene en tu invitación para confirmar tu asistencia.',
        side: 'top',
        align: 'center',
      },
    },
  ],

  confirm: [
    {
      element: '[data-tour="confirm-title"]',
      popover: {
        title: 'Confirma tu Asistencia',
        description: 'Estás en la página de confirmación. Aquí podrás indicar quiénes de tu grupo asistirán a la boda.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirm-message"]',
      popover: {
        title: 'Mensaje',
        description: 'Este mensaje te explica qué debes hacer en esta página.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirm-table"]',
      popover: {
        title: 'Tu Invitación',
        description: 'Aquí aparece tu nombre y el de tus acompañantes. Cada persona tiene un interruptor para confirmar o rechazar su asistencia.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirm-switches"]',
      popover: {
        title: 'Confirma o Rechaza',
        description: 'Usa los interruptores para indicar quién asistirá. Activa el switch para confirmar, desactívalo para rechazar.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirm-submit"]',
      popover: {
        title: 'Enviar Confirmación',
        description: 'Una vez que hayas verificado todos los datos, presiona este botón para enviar tu confirmación.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirm-adults"]',
      popover: {
        title: 'Solo Adultos',
        description: 'Ten en cuenta que la celebración es exclusiva para adultos.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="confirm-back"]',
      popover: {
        title: 'Regresar',
        description: 'Si necesitas volver a la página principal, usa este botón para regresar.',
        side: 'top',
        align: 'center',
      },
    },
  ],
  banco: [
    {
      element: '[data-tour="banco-title"]',
      popover: {
        title: 'Datos Bancarios',
        description: 'Esta es la página de datos bancarios. Aquí encontrarás la información para hacer una transferencia.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="banco-datos"]',
      popover: {
        title: 'Cuenta Bancaria',
        description: 'Estos son los datos de la cuenta bancaria de los novios. Puedes copiar el número de cuenta directamente.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="banco-regalo"]',
      popover: {
        title: 'Mesa de Regalos',
        description: 'Si prefieres, también puedes visitar la mesa de regalos de Liverpool.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="banco-back"]',
      popover: {
        title: 'Regresar',
        description: 'Usa este botón para volver a la página principal.',
        side: 'top',
        align: 'center',
      },
    },
  ],

  admin: [
    {
      element: '[data-tour="admin-header"]',
      popover: {
        title: 'Panel de Administración',
        description: 'Desde aquí puedes gestionar todas las confirmaciones de los invitados a la boda.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="admin-stats"]',
      popover: {
        title: 'Estadísticas Generales',
        description: 'Un resumen rápido del estado de las confirmaciones: totales, confirmados y pendientes.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="admin-charts"]',
      popover: {
        title: 'Gráficos',
        description: 'Visualiza los datos de confirmación de forma gráfica para tener una mejor perspectiva.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="admin-filters"]',
      popover: {
        title: 'Filtros',
        description: 'Filtra la lista de invitados por nombre, estado de confirmación o lado (novio/novia). También puedes exportar a CSV.',
        side: 'bottom',
        align: 'center',
      },
    },
    {
      element: '[data-tour="admin-table"]',
      popover: {
        title: 'Tabla de Invitados',
        description: 'Aquí puedes ver el detalle de cada invitado, su estado de confirmación y acompañantes.',
        side: 'top',
        align: 'center',
      },
    },
    {
      element: '[data-tour="admin-back"]',
      popover: {
        title: 'Volver al Sitio',
        description: 'Usa este botón para regresar a la página principal de la invitación.',
        side: 'bottom',
        align: 'center',
      },
    },
  ],
}
