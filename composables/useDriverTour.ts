import { driver } from 'driver.js'
import type { Config, DriveStep } from 'driver.js'

const baseConfig: Partial<Config> = {
  showProgress: true,
  animate: true,
  smoothScroll: true,
  overlayColor: 'rgba(0,0,0,0.5)',
  stagePadding: 8,
  stageRadius: 8,
  showButtons: ['next', 'previous', 'close'],
  nextBtnText: 'Siguiente →',
  prevBtnText: '← Anterior',
  doneBtnText: 'Finalizar',
  progressText: '{{current}} de {{total}}',
  popoverClass: 'mi-app-driver-popover',
}

export const useDriverTour = () => {
  const startTour = (steps: DriveStep[], overrides?: Partial<Config>) => {
    if (!import.meta.client) return

    // Filter out steps whose elements don't exist in the DOM
    const validSteps = steps.filter((step) => {
      if (!step.element) return true
      return document.querySelector(step.element as string) !== null
    })

    if (validSteps.length === 0) return

    const driverInstance = driver({
      ...baseConfig,
      ...overrides,
      onDestroyStarted: () => {
        driverInstance.destroy()
      },
      steps: validSteps,
    })

    driverInstance.drive()
  }

  return { startTour }
}
