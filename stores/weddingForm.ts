import { defineStore } from 'pinia'
import type { WeddingConfig } from '~/types/wedding-config'
import staticConfig from '~/wedding.config'

function deepClone<T>(obj: T): T {
  return JSON.parse(JSON.stringify(obj))
}

export const useWeddingFormStore = defineStore('weddingForm', {
  state: () => ({
    currentStep: 1,
    totalSteps: 7,
    formData: deepClone(staticConfig) as WeddingConfig,
    dirty: false,
    lastSaved: null as string | null,
  }),
  persist: true,
  actions: {
    setStep(step: number) {
      if (step >= 1 && step <= this.totalSteps) {
        this.currentStep = step
      }
    },

    nextStep() {
      if (this.currentStep < this.totalSteps) {
        this.currentStep++
      }
    },

    prevStep() {
      if (this.currentStep > 1) {
        this.currentStep--
      }
    },

    updateSection<K extends keyof WeddingConfig>(section: K, data: WeddingConfig[K]) {
      this.formData[section] = data
      this.dirty = true
    },

    loadFromConfig(config: WeddingConfig) {
      this.formData = deepClone(config) as WeddingConfig
      this.dirty = false
    },

    resetForm() {
      this.formData = deepClone(staticConfig) as WeddingConfig
      this.currentStep = 1
      this.dirty = false
      this.lastSaved = null
    },

    markSaved() {
      this.dirty = false
      this.lastSaved = new Date().toISOString()
    },
  },
})
