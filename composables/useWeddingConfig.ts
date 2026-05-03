import staticConfig from '~/wedding.config'
import type { WeddingConfig } from '~/types/wedding-config'

function deepMerge<T extends Record<string, any>>(base: T, override: Partial<T>): T {
  const result = { ...base } as any
  for (const key of Object.keys(override)) {
    const val = (override as any)[key]
    if (val !== null && val !== undefined && typeof val === 'object' && !Array.isArray(val) && typeof result[key] === 'object' && !Array.isArray(result[key])) {
      result[key] = deepMerge(result[key], val)
    } else if (val !== undefined) {
      result[key] = val
    }
  }
  return result
}

export const useWeddingConfig = (): WeddingConfig => {
  const { data } = useAsyncData<WeddingConfig>('wedding-config', () =>
    $fetch<WeddingConfig>('/api/wedding-config')
  )

  return reactive(
    computed<WeddingConfig>(() =>
      data.value
        ? deepMerge(staticConfig as WeddingConfig, data.value)
        : (staticConfig as WeddingConfig)
    )
  ) as WeddingConfig
}
