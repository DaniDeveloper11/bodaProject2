import { defineStore } from 'pinia'
import type { WeddingConfig } from '~/types/wedding-config'

export const useWeddingConfigStore = defineStore('weddingConfig', {
  state: () => ({
    config: null as WeddingConfig | null,
    loading: false,
    error: null as string | null,
  }),
  persist: true,
  actions: {
    async fetchConfig() {
      this.loading = true
      this.error = null
      try {
        const data = await $fetch<WeddingConfig>('/api/wedding-config')
        this.config = data
      } catch (err) {
        this.error = 'Error al cargar la configuración'
      } finally {
        this.loading = false
      }
    },

    async saveConfig(data: WeddingConfig) {
      this.loading = true
      this.error = null
      try {
        await $fetch('/api/wedding-config', {
          method: 'PUT',
          body: data,
        })
        this.config = data
      } catch (err) {
        this.error = 'Error al guardar la configuración'
        throw err
      } finally {
        this.loading = false
      }
    },

    async uploadImage(file: File, fieldKey: string): Promise<string> {
      const formData = new FormData()
      formData.append(fieldKey, file)

      const result = await $fetch<{ uploaded: { fieldKey: string; path: string }[] }>(
        '/api/wedding-config/upload',
        { method: 'POST', body: formData }
      )

      if (result.uploaded.length === 0) {
        throw new Error('No se pudo subir la imagen')
      }

      return result.uploaded[0].path
    },
  },
})
