<template>
  <button
    v-if="visible"
    title="Reiniciar tour"
    class="fixed bottom-6 right-6 z-50 w-12 h-12 rounded-full bg-brand-cyan text-white shadow-lg flex items-center justify-center text-xl font-bold hover:bg-brand-cyan/90 hover:scale-110 transition-all duration-200"
    @click="replay"
  >
    ?
  </button>
</template>

<script setup lang="ts">
import { TOURS } from '~/constants/tours'

const { startTour } = useDriverTour()
const route = useRoute()

const visible = ref(false)

const tourMap: Record<string, { key: string; tour: string }> = {
  '/': { key: 'boda_tour_seen', tour: 'home' },
  '/confirm': { key: 'boda_confirm_tour_seen', tour: 'confirm' },
  '/banco': { key: 'boda_banco_tour_seen', tour: 'banco' },
  '/admin': { key: 'boda_admin_tour_seen', tour: 'admin' },
}

onMounted(() => {
  const entry = tourMap[route.path] ?? tourMap['/']
  visible.value = localStorage.getItem(entry.key) === 'true'
})

const replay = () => {
  const entry = tourMap[route.path] ?? tourMap['/']
  startTour(TOURS[entry.tour])
}
</script>
